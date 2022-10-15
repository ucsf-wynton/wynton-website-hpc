#' Get the module path
#'
#' @return
#' A character vector of environment module folders.
#'
#' @export
module_path <- function() {
  path <- Sys.getenv("MODULEPATH", NA_character_)
  if (is.na(path)) return(path)
  strsplit(path, split = .Platform[["path.sep"]], fixed = TRUE)[[1]]
}
