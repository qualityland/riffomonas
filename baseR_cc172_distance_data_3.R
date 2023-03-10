# Code Club episode CC172 2021-12-16

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

# extract number of samples from first element
n_samples <- as.numeric(distances[1])
n_samples

# remove number of samples from vector
distances <- distances[-1]
distances

# prepare distance matrix
dist_matrix <- matrix(0, nrow = n_samples, ncol = n_samples)
dist_matrix

# prepare sample names vector
samples <- rep("", n_samples)

######################### brute force way (manual) #########################

##### sample 1 #####
samples[1] <- distances[1] # get sample name
distances <- distances[-1] # remove sample name from vector

##### sample 2 #####
samples[2] <- distances[1] # get sample name
distances <- distances[-1] # remove sample name from vector

dist_matrix[2, 1] <- as.numeric(distances[1])
distances <- distances[-1] # remove distance from vector

##### sample 3 #####
samples[3] <- distances[1] # get sample name
distances <- distances[-1] # remove sample name from vector

dist_matrix[3, 1:2] <- as.numeric(distances[1:2])
distances <- distances[-(1:2)] # remove distances from vector

##### sample 4 #####
samples[4] <- distances[1] # get sample name
distances <- distances[-1] # remove sample name from vector

dist_matrix[4, 1:3] <- as.numeric(distances[1:3])
distances <- distances[-(1:3)] # remove distances from vector

##### sample 5 #####
samples[5] <- distances[1] # get sample name
distances <- distances[-1] # remove sample name from vector

dist_matrix[5, 1:4] <- as.numeric(distances[1:4])
distances <- distances[-(1:4)] # remove distances from vector

##### sample 6 #####
samples[6] <- distances[1] # get sample name
distances <- distances[-1] # remove sample name from vector

dist_matrix[6, 1:5] <- as.numeric(distances[1:5])
distances <- distances[-(1:5)] # remove distances from vector

##### sample 7 #####
samples[7] <- distances[1] # get sample name
distances <- distances[-1] # remove sample name from vector

dist_matrix[7, 1:6] <- as.numeric(distances[1:6])
distances <- distances[-(1:6)] # remove distances from vector

##### sample 8 #####
samples[8] <- distances[1] # get sample name
distances <- distances[-1] # remove sample name from vector

dist_matrix[8, 1:7] <- as.numeric(distances[1:7])
distances <- distances[-(1:7)] # remove distances from vector

##### sample 9 #####
samples[9] <- distances[1] # get sample name
distances <- distances[-1] # remove sample name from vector

dist_matrix[9, 1:8] <- as.numeric(distances[1:8])
distances <- distances[-(1:8)] # remove distances from vector

##### sample 10 #####
samples[10] <- distances[1] # get sample name
distances <- distances[-1] # remove sample name from vector

dist_matrix[10, 1:9] <- as.numeric(distances[1:9])
distances <- distances[-(1:9)] # remove distances from vector
