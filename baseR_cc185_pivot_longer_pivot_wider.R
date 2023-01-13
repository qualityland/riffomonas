# Code Club episode CC185 2022-02-07

# Sample names like F3D125 are set together as follows:
#    F - sex of the animal
#    3 - identifier for the animal
# D125 - day 125 post weaning (Entwoehnung)

library(tidyverse)
source("code/read_matrix.R")

dist_matrix <- read_matrix("data/mice.braycurtis.dist")

dist_tbl <- as_tibble(dist_matrix, rownames = "samples")


sample_lookup <- dist_tbl %>%
  select(samples) %>%
  mutate(delimited = str_replace(samples,
                                 "^(([FM])\\d+)D(\\d+)$",
                                 "\\2-\\1-\\3")) %>% 
  separate(col = delimited,
           into = c("sex", "animal", "day"),
           sep = "-",
           convert = TRUE)

dist_tbl %>% 
  pivot_longer(cols = -samples, names_to = "b", values_to = "distances") %>%
  filter(samples > b) %>% # only lower triangle distances
  pivot_wider(names_from = "b", values_from = "distances")



dist_tbl %>% 
  pivot_longer(cols = -samples, names_to = "b", values_to = "distances") %>%
  inner_join(., sample_lookup)
