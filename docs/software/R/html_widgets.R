repos_buttons <- function(modules_sets) {
  cat('<ul class="nav nav-pills">\n')
  for (kk in seq_along(modules_sets)) {
    name <- names(modules_sets)[kk]
    modules <- modules_sets[[name]]
    nbr_of_modules <- nrow(modules)
    cat('<li', if (kk == 1) ' class="active"', '><a data-toggle="pill" href="#queues-', tolower(name), '"><span style="font-weight: bold;">', name, '</span>&nbsp;(', nbr_of_modules, ')</a></li>\n', sep = "")
  }
  cat('</ul>\n')
}
