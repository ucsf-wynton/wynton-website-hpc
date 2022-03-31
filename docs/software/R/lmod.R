library(utils)
library(R.utils)
library(jsonlite)
library(commonmark)

trim <- function(x) {
  if (!is.character(x)) return(x)
  x <- sub("^[\t\n\f\r ]*", "", x)
  sub("[\t\n\f\r ]*$", "", x)
}

#' @importFrom commonmark markdown_html
as_html <- function(x) {
  if (!is.character(x)) return(x)
  x <- commonmark::markdown_html(x, extensions = TRUE)
  x <- gsub("(^<p>|</p>\n$)", "", x)
  x
}


#' @importFrom utils file_test
find_spider <- local({
  spider <- NULL

  function() {
    if (is.null(spider)) {
      lmod_dir <- file.path(Sys.getenv("LMOD_DIR"))
      stopifnot(nzchar(lmod_dir))
      bin <- file.path(lmod_dir, "spider")
      message(" - spider binary: ", sQuote(bin))
      stopifnot(utils::file_test("-x", bin))
      spider <<- bin
    }
    spider
  }
})


#' @importFrom utils file_test
spider <- function(module_path, force = FALSE) {
  message(sprintf("spider('%s') ...", module_path))
  
  ## Already on file?
  pathname <- file.path("lmod_data", sprintf("%s.json", module_path))
  message("- pathname: ", pathname)
  if (force || !utils::file_test("-f", pathname)) {
    stopifnot(utils::file_test("-d", module_path))
    path <- dirname(pathname)
    dir.create(path, recursive = TRUE)
    stopifnot(utils::file_test("-d", path))
    spider <- find_spider()
    args <- c("--no_recursion", "-o jsonSoftwarePage", module_path)
    message(" - spider arguments: ", paste(args, collapse = " "))
    res <- system2(spider, args = args, stdout = pathname)
    message(" - spider result: ", res)
    stopifnot(utils::file_test("-f", pathname))
  }
  json <- readChar(pathname, nchars = file.size(pathname))
#  message(" - spider json result: ", json)
  
  message(sprintf("spider('%s') ... done", module_path))
  json
}


#' @importFrom utils file_test
#' @importFrom R.utils mstr
#' @importFrom jsonlite fromJSON
#' @importFrom utils file_test
module_avail <- local({
  ## Memoization
  .cache <- list()
  
  function(info, onMissingPath = getOption("onMissingPath", c("okay", "error", "warning", "ignore"))) {
    message("module_avail() ...", appendLF = FALSE)
    onMissingPath <- match.arg(onMissingPath)
    
    stopifnot(is.list(info), "module_path" %in% names(info))
    module_path <- info$module_path
    key <- paste(module_path, collapse = ", ")
    res <- .cache[[key]]
    if (!is.null(res)) {
      message("already cached")
      return(res)
    }

    message(""); R.utils::mstr(list(info = info))
    if (all(!nzchar(module_path))) {
      stop("Specified empty folder(s): ", paste(sQuote(module_path), collapse = ", "))
    }
    
    if (onMissingPath != "okay") {
      unknown <- module_path[!utils::file_test("-x", module_path)]
      if (length(unknown) > 0) {
        msg <- sprintf("No such folder(s): %s", paste(sQuote(unknown), collapse = ", "))
        if (onMissingPath == "error") stop(msg)
        if (onMissingPath == "warning") warning(msg)
        return(NULL)
      }
    }

    json <- spider(module_path)
    x <- jsonlite::fromJSON(json)
    o <- order(x$package)
    x <- x[o,]
    keep <- !grepl("^[.]", x$package)
    x <- x[keep,]
    message("done")


    message("Prune ...")
    versions <- x$versions
    versions <- lapply(versions, FUN = function(version) {
      path <- version$path
      ## WORKAROUND
      keep <- lapply(module_path, FUN = function(mpath) grepl(mpath, path, fixed = TRUE))
      keep <- Reduce(`|`, keep)
      if (!all(keep)) {
        version <- version[keep, ]
        path <- path[keep]
	version$path <- path
      }
      version
    })
    ns <- vapply(versions, FUN.VALUE = NA_integer_, FUN = function(version) {
      ## Hidden modules have version == list()
      if (is.null(dim(version))) 0L else nrow(version)
    })
    stopifnot(is.numeric(ns), !anyNA(ns))
    x <- x[ns > 0, ]

    attr(x, "info") <- info
    message("done")

    .cache[[key]] <<- x

    x
  }
})

get_modules_sets <- function(module_repositories) {
  modules_sets <- lapply(names(module_repositories), FUN = function(name) {
    info <- module_repositories[[name]]
    modules <- module_avail(info)
    if (!is.null(modules)) attr(modules, "repository") <- name
    modules
  })
  names(modules_sets) <- names(module_repositories)

  ## Drop empty sets
  modules_sets <- modules_sets[lengths(modules_sets) > 0]

  modules_sets
}


parse_module <- function(m) {
  m <- lapply(m, FUN = trim)

  ## Trim versions
  versions <- m$versions[[1]]
  for (cc in seq_len(ncol(versions))) {
    versions[[cc]] <- trim(versions[[cc]])
  }
  m$versions[[1]] <- versions

  ## Identify parents
  parent <- m$versions[[1]]$parent
  parent <- unique(unlist(parent, use.names = FALSE))
  ## FIXME /HB 2021-05-05
  parent <- setdiff(parent, c("built-in", "Sali"))
  parent <- setdiff(parent, c("CBI", "Sali"))
  if (length(parent) > 0 && !is.element(parent, c("CBI-testing")))
    parent <- character(0)
  stopifnot(length(parent) <= 1L)
  m$parent <- parent

  ## Parse help
  helps <- unique(versions$help)
  help <- helps[[1]]
  m$help <- help

  ## Parse versions
  vers <- NULL
  if (!is.null(versions$versionName)) {
    vers <- unique(versions$versionName)
    names(vers) <- rep("", times = length(vers))
    if (length(vers) > 1L || vers != "default") {
#      vers <- gtools::mixedsort(vers)
      idx <- match(m$defaultVersionName, table = vers)
      if (length(idx) == 1) {
        ## FIXME: spider seems to set 'defaultVersionName' randomly /HB 2017-06-30
        ## Yup, this is still a problem with Lmod 6.6 /HB 2022-02-03
        names(vers)[idx] <- "default"
      }
    } else {
      vers <- NULL
    }
  }
  m$version <- vers

  ## Extract 'Nnnn: ' content from the end.
  if (length(m$description) > 0L) {
    pattern <- "(.*)[[:space:]]+(Examples?|Note|Warning|Maintainer):[[:space:]]+(.*)"
    while(grepl(pattern, m$description)) {
      name <- gsub(pattern, "\\2", m$description)
      name <- sub("s$", "", name)
      name <- tolower(name)
      m[[name]] <- gsub(pattern, "\\3", m$description)
      m$description <- gsub(pattern, "\\1", m$description)
    }
  }

  ## Get the Lua module code
  names <- names(m[["version"]])
  idx <- which(names == "default")
  ## The module does not have versions?
  if (length(idx) == 0L && length(m[["default"]]) == 0L && length(names) == 0L) idx <- 1L
  ## The module ...?
  if (length(idx) == 0L && length(names) == 1L) idx <- 1L
  if (length(idx) == 1L && is.finite(idx)) {
    path <- m$versions[[1]][idx,"path"]
    if (!is.na(path) && utils::file_test("-f", path)) {
      m$code <- readLines(path, warn = FALSE)
    }
  } else {
    ## The module does not have versions
    R.utils::cstr(list(idx = idx, names = names, default = m[["version"]][idx], versions = m$versions[[1]], default = m$versions[[1]][idx, ], path=m$versions[[1]][idx,"path"]))
    stop("INTERNAL ERROR: Should not happen")
  }

  ## Trim fields
  for (field in c("description", "url", "warning")) {
    if (is.null(m[[field]])) next
    if (is.na(m[[field]])) m[[field]] <- NULL
  }

  m
} ## parse_module()

