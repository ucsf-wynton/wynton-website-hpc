#' @importFrom gtools mixedsort
#' @importFrom R.utils cstr
#' @export
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
#      vers <- mixedsort(vers)
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
    if (!is.na(path) && file_test("-f", path)) {
      m$code <- readLines(path, warn = FALSE)
    }
  } else {
    ## The module does not have versions
    cstr(list(idx = idx, names = names, default = m[["version"]][idx], versions = m$versions[[1]], default = m$versions[[1]][idx, ], path=m$versions[[1]][idx,"path"]))
    stop("INTERNAL ERROR: Should not happen")
  }

  ## Trim fields
  for (field in c("description", "url", "warning")) {
    if (is.null(m[[field]])) next
    if (is.na(m[[field]])) m[[field]] <- NULL
  }

  m
} ## parse_module()
