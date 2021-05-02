#' @export
json_paths <- function(json) {
  json %>%
    tidyjson::as.tbl_json() %>%
    tidyjson::json_structure() %>%
    transmute(seq, path = sapply(seq, function(i) paste(i, collapse = ".")))
}

