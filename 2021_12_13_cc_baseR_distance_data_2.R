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
