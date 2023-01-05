# Code Club episode CC178 2022-01-13

# create directory structure
list.files()

dir.create("data")
dir.create("code")
dir.create("results")

list.files()

list.files(path = "data")

# move files
file.rename("read_matrix.R", "code/read_matrix.R")

# copy files
file.copy("README.md", "results")

# list certain files
list.files(pattern = "dist").   # dist
list.files(pattern = "\\.dist") # .dist

# move files
dist_files <- list.files(pattern = "\\.dist")
file.copy(from = dist_files, to = "data")
list.files("data")
file.remove(dist_files)
