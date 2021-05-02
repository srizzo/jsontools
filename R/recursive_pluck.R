#' @export
recursive_pluck <- function(.x, ...) {
  acc <- list()
  ret <- purrr::pluck(.x, ...)

  while (!is.null(ret)) {
    acc <- c(acc, list(ret))
    ret <- purrr::pluck(ret, ...)
  }

  acc
}

# list(a = list(a = list(a = list(b = 0), b = 1), b = 2), b = 3) %>%
#   recursive_pluck("a")
