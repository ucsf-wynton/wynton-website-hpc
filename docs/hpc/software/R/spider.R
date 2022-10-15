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
    if (force && file_test("-d", path)) unlink(path, recursive = TRUE)
    dir.create(path, recursive = TRUE)
    stopifnot(file_test("-d", path))
    spider <- find_spider()

    ## WORKAROUND:
    ## We can't have repository modules (e.g. CBI.lua and Sali.lua) in the
    ## module folder we scan, because then their modules will contaminate
    ## our scan.
    ## See also https://github.com/ucsf-wynton/wynton-website-hpc/issues/54
    files <- dir(module_path, all.files = TRUE, full.names = TRUE, no.. = TRUE)
    if (any(grepl("[.]lua$", files))) {
      ## We work around the problem by creating a temporary clone of
      ## 'module_path' without and files and only subfolders
      dirs <- files[file_test("-d", files)]
      scan_path <- file.path(tempdir(), basename(module_path))
      dir.create(scan_path)
      on.exit(unlink(scan_path, recursive = TRUE), add = TRUE)
      for (dir in dirs) {
        file.symlink(from = normalizePath(dir), to = file.path(scan_path, basename(dir)))
      }
    } else {
      scan_path <- module_path
    }
    
    args <- c("--no_recursion", "-o jsonSoftwarePage", scan_path)
    if (debug) message(" - spider arguments: ", paste(args, collapse = " "))
    pathname_t <- tempfile()
    res <- system2(spider, args = args, stdout = pathname_t)
    if (debug) message(" - spider result: ", res)
    stopifnot(file_test("-f", pathname_t))

    ## We need to update output file to not include any temporary paths,
    ## but the original ones
    if (scan_path != module_path) {
      json <- readChar(pathname_t, nchars = file.size(pathname_t))
      esc <- function(x) gsub("/", "\\/", fixed = TRUE, x)
      json <- gsub(esc(scan_path), esc(module_path), fixed = TRUE, json)
      cat(json, file = pathname_t)
    }
    file.copy(pathname_t, pathname, overwrite = TRUE)
    file.remove(pathname_t)
  }

  json <- readChar(pathname, nchars = file.size(pathname))

#  if (debug) message(" - spider json result: ", json)
  
  if (debug) message(sprintf("spider('%s') ... done", module_path))
  json
}
