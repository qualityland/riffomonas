# Code Club episode CC184 2022-02-03

# Sample names like F3D125 are set together as follows:
#    F - sex of the animal
#    3 - identifier for the animal
# D125 - day 125 post weaning (Entwoehnung)

library(tidyverse)
source("code/read_matrix.R")

dist_matrix <- read_matrix("data/mice.braycurtis.dist")

dist_tbl <- as_tibble(dist_matrix, rownames = "samples")

# sample_lookup <- dist_tbl %>%
#   select(samples) %>%
#   mutate(animal = str_replace(samples, "D\\d+$", ""),
#          sex = str_replace(samples, "^([FM])\\w+", "\\1"),
#          day = as.numeric(str_replace(samples, "\\w\\d*D(\\d+)$", "\\1"))) 


sample_lookup <- dist_tbl %>%
  select(samples) %>%
  mutate(delimited = str_replace(samples,
                                 "^(([FM])\\d+)D(\\d+)$",
                                 "\\2-\\1-\\3")) %>% 
  separate(col = delimited,
           into = c("sex", "animal", "day"),
           sep = "-",
           convert = TRUE)

