# Code Club episode CC173

# read in data
distances <-
  scan(
    #file = "data/mice_simple.braycurtis.dist",  # sample size: 10
    file = "data/mice.braycurtis.dist",    # sample size: 348
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

# element 1 has not distance to add
samples[1] <- distances[1]
distances <- distances[-1]

# elements 2 to 10
for (i in 2:n_samples) {
  # sample names
  samples[i] <- distances[1]
  distances <- distances[-1]
  # distances
  dist_matrix[i, 1:(i-1)] <- as.numeric(distances[1:(i-1)])
  dist_matrix[1:(i-1), i] <- dist_matrix[i, 1:(i-1)] # optional: add transposed values
  distances <- distances[-(1:(i-1))]
}
