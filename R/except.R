#' @export
except <- function(.x, ...) {
  names <- c(...)
  .x %>%
    magrittr::extract(., which(!names(.) %in% names))
}

# list(a=1,b=2, c=3) %>%
#   except(c("a", "b"))
