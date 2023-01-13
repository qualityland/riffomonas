# Code Club episode CC183 2022-01-31

# Sample names like F3D125 are set together as follows:
#    F - sex of the animal
#    3 - identifier for the animal
# D125 - day 125 post weaning (Entwoehnung)

library(tidyverse)
source("code/read_matrix.R")

dist_matrix <- read_matrix("data/mice.braycurtis.dist")

dist_tbl <- as_tibble(dist_matrix, rownames = "samples")

dist_tbl %>% 
  select(samples) %>% 
  #mutate(test = sub(pattern = "F", replacement = "female", x = samples)) %>% 
  #mutate(test = str_replace(samples, "F", "female")) %>% 
  mutate(animal = str_replace(samples, "D\\d*", ""),
         sex = str_replace(samples, "\\d*D\\d*", ""),
         day = as.numeric(str_replace(samples, "\\w\\d*D", "")))
 