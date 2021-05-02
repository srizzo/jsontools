#' @export
flatten_json <- function(.x) {
  .x %>%
    tidyjson::json_structure() %>%
    filter(type != "object" &
             type != "array" &
             type != "null") %>%

    mutate(path = sapply(seq, function(i) paste(i, collapse = ".")),
           value = ..JSON) %>%

    select(matches("document.id|path|value")) %>%
    as_tibble() %>%
    tidyr::pivot_wider(names_from = path, values_from = value) %>%
    mutate(across(everything(), ~unlist(tidyr::replace_na(., NA))))
}

# list(
#   list(a=1, nested=list(b=2)),
#   list(a=1, nested=list(b=2))
# ) %>%
#   flatten_json()

# list(root =
#        list(object_list =
#               list(list(object_id = 1),
#                    list(object_id = 2),
#                    list(object_id = 3)),
#             nested =
#               list(leaf_object =
#                      list(a = 1, b = 2, c = 2)))) %>%
#   as.tbl_json %>%
#
#   # select(-document.id) %>%
#   # enter_object(nestedElement1, nestedElement2, arrayElement) %>% # change it
#   # gather_array("document.id") %>%
#
#   flatten_json %>%
#   identity -> result
