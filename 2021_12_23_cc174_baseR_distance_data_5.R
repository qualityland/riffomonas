# Code Club episode CC174

# read in data
file <-
  scan(
    file = "data/mice_simple.braycurtis.dist",  # sample size: 10
    #file = "data/mice.braycurtis.dist",    # sample size: 348
    what = character(),
    quiet = TRUE,
    sep = "\n"
  )

# extract number of samples from first element
n_samples <- as.numeric(file[1])
file <- file[-1]

# 
file_split <- strsplit(file, "\t")

fill_in <- function(x, length) {
  c(x, rep("0", length - length(x)))
}

# 
filled <- lapply(file_split, fill_in, length=n_samples + 1)

# bind list to matrix
sample_distance_matrix <- do.call(rbind, filled)
# also fine:
#sample_distance_matrix <- matrix(unlist(filled), nrow = n_samples, byrow = TRUE)

# sample names
samples <- sample_distance_matrix[,1]
dist_matrix <- sample_distance_matrix[,-1]

# numeric values
dist_matrix <- matrix(as.numeric(dist_matrix), nrow = n_samples, ncol = n_samples)

# add transpose
dist_matrix <- dist_matrix + t(dist_matrix)

dist_matrix
samples

