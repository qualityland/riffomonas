# Code Club episode CC169

# does not work with lower triangle distance data
# library(tidyverse)
# df <- read_tsv("data/mice_simple.braycurtis.dist", skip = 1)
# df


# use scan to read in lower triangle data
distances <-
  scan(
    file = "data/mice_simple.braycurtis.dist",
    what = character(),
    quiet = TRUE,
    sep = "\t"
  )

# returns a character vector
distances
