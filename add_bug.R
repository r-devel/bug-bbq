# remotes::install_github("llrs/bugRzilla")

library(bugRzilla)
library(gh)

id <- 17616
label <- "needs diagnosis"

{
    bug <- get_bug(id)
    gh(
        endpoint = "POST /repos/r-devel/bug-bbq/issues",
        title = paste0("Bug ", id, " - ", bug$summary),
        body = paste0("View bug on Bugzilla (reference only): ",
                      "https://bugs.r-project.org/show_bug.cgi?id=", id),
        labels = c(bug$component, "needs diagnosis")
    )
}
