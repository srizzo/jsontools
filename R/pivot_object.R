#' @export
pivot_key_values_longer <- function(data, prefix, names_from, values_from) {
  array_path_regex <- paste0("^(", prefix, ")\\.([0-9]+)\\.(", names_from, "|", values_from, ")$")
  index_prefixed_array_path_regex <- paste0("^([0-9]+)\\.(", prefix, "\\.(?:", names_from, "|", values_from, "))$")

  data %>%
    rename_with(~gsub(array_path_regex, "\\2.\\1.\\3", .x), matches(array_path_regex)) %>%
    pivot_longer(matches(index_prefixed_array_path_regex),
                 names_to = c(paste0(prefix, ".id"), ".value"),
                 names_pattern = index_prefixed_array_path_regex)
}

#' @export
pivot_key_values_wider <- function(data, prefix, names_from, values_from) {
  data %>%
    pivot_wider(
      id_cols = !matches(paste0("^(", prefix, ")\\.(", names_from, "|", values_from, ")$")),
      values_fn = unique,
      names_from = paste0(prefix, ".", names_from),
      values_from = paste0(prefix, ".", values_from),
      names_prefix = paste0(prefix, ".")
    )
}

#' @export
pivot_list_wider <- function(data, prefix, names_from, values_from) {
  data %>%
    pivot_key_values_longer(prefix, names_from, values_from) %>%
    pivot_key_values_wider(prefix, names_from, values_from)
}
