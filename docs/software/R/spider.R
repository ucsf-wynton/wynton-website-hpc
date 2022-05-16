#' @param module_path A folder with environment modules.
#'
#' @param force If FALSE, and results are already cached, then the
#' cached results are returned.
#'
#' @return
#' A non-parsed, JSON string.
#'
#' @importFrom utils file_test
#' @export
spider <- function(module_path, force = FALSE) {
  debug <- getOption("lmodweb.debug", FALSE)
  if (debug) message(sprintf("spider('%s') ...", module_path))
  
  ## Already on file?
  pathname <- file.path("lmod_data", sprintf("%s.json", module_path))
  if (debug) message("- pathname: ", pathname)
  if (force || !file_test("-f", pathname)) {
    stopifnot(file_test("-d", module_path))
    path <- dirname(pathname)
    dir.create(path, recursive = TRUE)
    stopifnot(file_test("-d", path))
    spider <- find_spider()

    ## Locate potential module subfolders
    ## Note, this way we can exclude any *.lua files in the 'module_path'
    ## folder, e.g. repository modules such as CBI.lua and Sali.lua,
    ## which we don't want to recursively parse.
    dirs <- dir(module_path, all.files = TRUE, full.names = TRUE, no.. = TRUE)
    dirs <- dirs[file_test("-d", dirs)]
    print(dirs)
    
    args <- c("--no_recursion", "-o jsonSoftwarePage", dirs)
    if (debug) message(" - spider arguments: ", paste(args, collapse = " "))
    res <- system2(spider, args = args, stdout = pathname)
    if (debug) message(" - spider result: ", res)
    stopifnot(file_test("-f", pathname))
  }
  json <- readChar(pathname, nchars = file.size(pathname))
#  if (debug) message(" - spider json result: ", json)
  
  if (debug) message(sprintf("spider('%s') ... done", module_path))
  json
}
