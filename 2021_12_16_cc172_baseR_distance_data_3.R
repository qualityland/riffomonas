# Code Club episode CC172

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

n_samples <- distances[1]

distances <- distances[-1]
distances


###############################################################################
