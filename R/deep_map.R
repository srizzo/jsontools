#' @export
deep_map <- function(.x, .f, .where = list()) {
  .f <- rlang::as_function(.f)

  if (length(.where) == 0) return(.f(.x))

  hop <- head(.where, 1)[[1]]
  if (hop == "[]") return(purrr::map(.x, ~deep_map(.x, .f, tail(.where, -1))))

  purrr::modify_in(.x, hop, ~deep_map(.x, .f, tail(.where, -1)))
}

# print("top level")
# 1 %>%
#   deep_map(~"1r") %>%
# { . == "1r" }
#
# print("list")
# list(
#   list(a = "a", b = "b")
# ) %>%
#   deep_map("[]", .f = ~"lr") %>%
#   useful::compare.list(list("lr"))
#
# print("names")
# list(a = "a", b = "b") %>%
#   deep_map("a", .f = ~"ra") %>%
#   useful::compare.list(list(a = "ra", b = "b"))
#
# print("deep names")
# list(a = list(aa = "aa"), b = "b") %>%
#   deep_map(c("a", "aa"), .f = ~"raa") %>%
#   useful::compare.list(list(a = list(aa = "raa"), b = "b"))
#
#
# print("list, name")
# list(
#   list(a = "a", b = "b")
# ) %>%
#   deep_map(c("[]", "a"), .f = ~"ra") %>%
#   useful::compare.list(list(list(a = "ra", b = "b")))
#
#
# print("list, name, list, name")
# list(
#   list(a = "a", b =
#     list(
#       list(bb = "bb")))
# ) %>%
#   deep_map(c("[]", "b", "[]", "bb"), .f = ~"rbb") %>%
#   useful::compare.list(
#     list(
#       list(a = "a", b = list(list(bb = "rbb")))
#     )
#   )
#
# print("index")
# list(1,2,3) %>%
#   deep_map(1, .f = ~ "r1")
#
# print("index, name, index, name")
# list(
#   list(a = "a", b =
#     list(
#       list(bb = "bb")))
# ) %>%
#   deep_map(list(1, "b", 1, "bb"), .f = ~"rbb") %>%
#   useful::compare.list(
#     list(
#       list(a = "a", b = list(list(bb = "rbb")))
#     )
#   )
# 
# 
# list(list(a = list(1, 2, 3))) %>%
#   deep_map(list("[]", "a", 1), .f = ~list(message = 1, aa = 11, bb = 22))
# 
