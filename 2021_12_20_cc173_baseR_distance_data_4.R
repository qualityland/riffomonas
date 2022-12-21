# Code Club episode CC173

# read in data
distances <-
  scan(
    file = "data/mice_simple.braycurtis.dist",
    what = character(),
    quiet = TRUE,
    sep = "\t"
  )

# extract number of samples from first element
n_samples <- as.numeric(distances[1])
distances <- distances[-1]

# prepare distance matrix & sample names vector
dist_matrix <- matrix(0, nrow = n_samples, ncol = n_samples)
samples <- rep("", n_samples)

## DRY version with for loop

# 1st element has not distance to add
samples[1] <- distances[1]
distances <- distances[-1]

# elements 2 to 10
for (i in 2:n_samples) {
  samples[i] <- distances[1]
  distances <- distances[-1]
  dist_matrix[i, 1:(i-1)] <- as.numeric(distances[1:(i-1)])
  distances <- distances[-(1:(i-1))]
}
