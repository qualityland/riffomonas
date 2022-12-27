# Code Club episode CC172 2021-12-16

## Matrices

matrix(data = 1:100, nrow = 10)

matrix(data = 1:100, nrow = 10, ncol = 10)

matrix(data = 1:100, nrow = 10, ncol = 10, byrow = TRUE)

x <- matrix(data = 1:100, nrow = 10, ncol = 10, byrow = FALSE) # default

# 2nd row, 4th column
x[2, 4]

# 5th column
x[, 5]

# 3rd row
x[3,]

# create empty matrix
matrix(rep(0, 100), nrow = 10)
# or
matrix(0, nrow = 10, ncol = 10)
