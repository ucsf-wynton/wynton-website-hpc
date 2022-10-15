#' @param info ...
#'
#' @param onMissingPath ...
#'
#' @param force If TRUE, cached results are ignored.
#'
#' @return ...
#'
#' @importFrom utils file_test
#' @importFrom R.utils mstr
#' @importFrom jsonlite fromJSON
#' @importFrom utils file_test
#' @export
module_avail <- local({
  ## Memoization
  .cache <- list()
  
  function(info, onMissingPath = getOption("onMissingPath", c("okay", "error", "warning", "ignore")), force = FALSE) {
    stopifnot(is.list(info), "module_path" %in% names(info))
    onMissingPath <- match.arg(onMissingPath)
    stopifnot(length(force) == 1L, is.logical(force), !is.na(force))

    module_path <- info$module_path
    if (all(!nzchar(module_path))) {
      stop("Specified empty folder(s): ", paste(sQuote(module_path), collapse = ", "))
    }

    message("module_avail() ...", appendLF = FALSE)
    
    key <- paste(module_path, collapse = ", ")
    if (!force && !is.null(res <- .cache[[key]])) {
      message("already cached")
      return(res)
    }

    message(""); mstr(list(info = info))
    
    if (onMissingPath != "okay") {
      unknown <- module_path[!file_test("-x", module_path)]
      if (length(unknown) > 0) {
        msg <- sprintf("No such folder(s): %s", paste(sQuote(unknown), collapse = ", "))
        if (onMissingPath == "error") stop(msg)
        if (onMissingPath == "warning") warning(msg)
        return(NULL)
      }
    }

    json <- spider(module_path, force = force)
    x <- fromJSON(json)
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
