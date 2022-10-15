#' Locate the 'spider' executable
#'
#' @return
#' The pathname of the `spider` executable
#'
#' @importFrom utils file_test
#' @export
find_spider <- local({
  spider <- NULL

  function() {
    if (is.null(spider)) {
      lmod_dir <- file.path(Sys.getenv("LMOD_DIR"))
      stopifnot(nzchar(lmod_dir))
      bin <- file.path(lmod_dir, "spider")
      debug <- getOption("lmodweb.debug", FALSE)
      if (debug) message(" - spider binary: ", sQuote(bin))
      stopifnot(file_test("-x", bin))
      spider <<- bin
    }
    spider
  }
})
