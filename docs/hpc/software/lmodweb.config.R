#' @export
module_repositories <- list(
  "built-in" = list(
    name        = "built-in",
    maintainer  = "{{ site.cluster.nickname }} Systems Administrators",
    group       = "{{ site.cluster.name }}",
    url         = "{{ '/about/contact.html' | relative_url }}",
    contributed = FALSE,
    module_path = c("/etc/modulefiles", "/usr/share/modulefiles")[1] ## FIXME
  ),

  CBI = list(
    name        = "CBI",
    maintainer  = "Henrik Bengtsson",
    group       = "Computational Biology and Informatics",
    url         = "https://cbi.ucsf.edu",
    contributed = TRUE,
    module_path = Sys.getenv("MODULE_ROOT_CBI")
  ),

  Sali = list(
    name        = "Sali",
    maintainer  = "Ben Webb",
    group       = "Sali Lab Software Repository",
    url         = "https://salilab.org/",
    contributed = TRUE,
    module_path = Sys.getenv("MODULE_ROOT_Sali", "/salilab/diva1/home/modules")
  )
)
