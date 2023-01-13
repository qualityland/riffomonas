# Code Club episode CC180 2022-01-20

# create matrix from distance matrix
source("code/read_matrix.R")
dist_matrix <- read_matrix("data/mice_simple.braycurtis.dist")
dist_matrix

str(dist_matrix)
colnames(dist_matrix)
rownames(dist_matrix)
dimnames(dist_matrix)

dist_matrix[1, ]
dist_matrix["F3D11",]
dist_matrix["F3D11", "F3D125"]


# Distance matrix
dist_dist <- as.dist(dist_matrix)
dist_dist
dist_dist[5] # 5th element

str(dist_dist)
attr(dist_dist, "Labels")
attr(dist_dist, "Size")
attr(dist_dist, "call")
attr(dist_dist, "Diag")
attr(dist_dist, "Upper")


# Data frame
dist_df <- as.data.frame(dist_matrix)
dist_df
str(dist_df)

## get columns / variables
dist_df[, 3]         # 3rd column as a vector
dist_df[3]           # 3rd column as a data frame
dist_df[, "F3D11"]   # named column as a vector
dist_df["F3D11"]     # named column as a data frame
dist_df$F3D11        # named column as a vector
dist_df[["F3D11" ]]  # named column as a vector


## get rows / observations
dist_df["F3D11", ]   # named row as a data frame
dist_df[3, ]         # 3rd row as a data frame

# replace rownames with a column for the sample
samples <- rownames(dist_df)
samples

dist_df$sample1 <- samples
dist_df

dist_df[, "sample2"] <- samples
dist_df

dist_df["sample3"] <- samples
dist_df

dist_df[["sample4"]] <- samples
dist_df

# add sample names to the 1st column
cbind(sample=samples, dist_df)

dist_df <- as.data.frame(dist_matrix)
dist_df <- cbind(samples=rownames(dist_df), dist_df) # add sample names as 1st column
rownames(dist_df) <- NULL                            # remove rownames
dist_df


# Tibbles
library(tibble)
dist_tbl <- as_tibble(dist_matrix, rownames="samples")
dist_tbl

dist_tbl <- as_tibble(read_matrix("data/mice.braycurtis.dist"), rownames="samples")
dist_tbl

print(dist_tbl, width = 100) # print up to 100 characters
print(dist_tbl, width = Inf) # print all variables (but only first 10 observations)
