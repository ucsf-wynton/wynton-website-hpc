library(lmodweb)
source("lmodweb.config.R")

distro <- c("centos7", "rocky8", "rocky9")[3]
modules_sets <- get_modules_sets(module_repositories, distros = distro)
R.utils::cstr(modules_sets)
