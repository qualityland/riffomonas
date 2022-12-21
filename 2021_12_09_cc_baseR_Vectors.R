# Code Club episode CC170

## Vectors

# automatic coercion (here: to character)
c(1, "b", TRUE)

# automatic coercion (here: to numeric)
c(1, 2, 3, 4, TRUE, FALSE)

# coercion functions
as.logical(c(1, 2, 3, 4, TRUE, FALSE))

as.numeric(c(1, 2, 3, 4, TRUE, FALSE))

as.numeric(c("a", "b", "c", 1, 2, 3)) # with warning!

as.character((c(1, 2, 3)))

# sequences
seq(from=1, to=100, by=10)

seq(0, 100, 10)

seq(20, 2, -3)

seq(2, 10, length.out=6)

# repeat
rep(c("a", "b"), times=5)

rep(c("a", "b"), times=c(3, 5))

rep(c("a", "b"), each=5)

rep(c("a", "b"), times=5, each=3)

rep(c("a", "b"), times=c(3, 5), each=2) # error!

rep(c("a", "b"), length.out=11)

# built-in vectors
letters  # lower case letters

LETTERS  # upper case letters

month.abb # abbrevated month names

month.name # month names
