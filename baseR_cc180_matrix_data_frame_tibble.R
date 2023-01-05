# Code Club episode CC180 2022-01-20

# create matrix from distance matrix
source("code/read_matrix.R")
dist_matrix <- read_matrix("data/mice_simple.braycurtis.dist")

str(dist_matrix)
dist_matrix[1, ]
dist_matrix["F3D11",]
dist_matrix["F3D11", "F3D125"]

# distance matrix
dist_dist <- as.dist(dist_matrix)
str(dist_dist)
