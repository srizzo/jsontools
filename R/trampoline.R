trampoline <- function(f, ...) {
  ret <- do.call(f, list(...))
  while (is.function(ret)) ret <- ret()
  ret
}

# even <- function(n) {
#   if (n == 0) TRUE else function() odd(n-1)
# }
#
# odd <- function(n) {
#   if (n == 0) FALSE else function() even(n-1)
# }
#
# trampoline(odd, 1000001)
