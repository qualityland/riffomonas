# Code Club episode CC171

# read in data
distances <-
  scan(
    file = "data/mice_simple.braycurtis.dist",
    what = character(),
    quiet = TRUE,
    sep = "\t"
  )

# returns a character vector
distances

n_samples <- as.numeric(distances[1])

distances <- distances[-1]
distances


###############################################################################

## Named Vectors

# number of legs
n_legs <- c(4, 2, 4, 0)
n_legs

# as named vector
n_legs <- c("dog" = 4, "chicken"= 2, "cat" = 4, "fish" = 0)
n_legs

n_legs["cat"]

n_legs["fish"]


# vector names and indexes
top10 <- c("2" = "SC Freiburg", "3" = "RB Leipzig", "1" = "Bayern Muenchen")

# returns index
top10[1]

# returns name
top10["1"]
