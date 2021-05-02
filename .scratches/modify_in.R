# purrr::modify_in()

# purrr::modify_at()

# imodify()


# list(
#   list(a = 1),
#   list(a = 2)
# ) %>%
#   modify_at(c(c(1, 1)), ~ .x + 10)

# list(1, 2, 3, 4, 5) %>%
#   modify_at(.at = c(1, 4, 5), .f = ~ .x)

# mtcars

# # Specify which columns to map with a numeric vector of positions:
# mtcars %>% modify_at(c(1, 4, 5), as.character) %>% str()
#
# # Or with a vector of names:
# mtcars %>% modify_at(c("cyl", "am"), as.character) %>% str()
