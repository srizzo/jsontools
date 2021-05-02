#' @export
modify_in_maybe <- function(.x, .where, .f, ...) {
  .where <- as.list(.where)
  .f <- rlang::as_function(.f)

  current_value <- purrr::pluck(.x, !!!.where)

  if (is.null(current_value)) return(.x)

  replacement <- .f(current_value, ...)

  purrr::assign_in(.x, .where, replacement)
}
