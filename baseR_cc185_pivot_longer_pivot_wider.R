# Code Club episode CC185 2022-02-07

# Sample names like F3D125 are set together as follows:
#    F - sex of the animal
#    3 - identifier for the animal
# D125 - day 125 post weaning (Entwoehnung)

library(tidyverse)
source("code/read_matrix.R")

dist_matrix <- read_matrix("data/mice.braycurtis.dist")

dist_tbl <- as_tibble(dist_matrix, rownames = "sample")


sample_lookup <- dist_tbl %>%
  select(sample) %>%
  mutate(delimited = str_replace(sample,
                                 "^(([FM])\\d+)D(\\d+)$",
                                 "\\2-\\1-\\3")) %>% 
  separate(col = delimited,
           into = c("sex", "animal", "day"),
           sep = "-",
           convert = TRUE)         # convert to appropriate type (e.g. numeric)

# pivot_longer - column names to values
dist_tbl %>% 
  pivot_longer(
    cols = -sample,                # affected columns (all except "sample")
    names_to = "compared_with",    # column names go here
    values_to = "distance")        # values go here
  

# pivot_wider - values become column names
dist_tbl %>% 
  pivot_longer(
    cols = -sample,
    names_to = "compared_with",
    values_to = "distance") %>%
  pivot_wider(
    names_from = "compared_with",
    values_from = "distance")


# Three Step Process: pivot_longer, filter, pivot_wider
# here:
# 1. make "long format" data
# 2. filter on upper / lower triangle data
# 3. format back to "wide format" data
dist_tbl %>% 
  pivot_longer(
    cols = -sample,                # all columns except "sample"
    names_to = "b",
    values_to = "distance") %>%
  filter(sample > b) %>%           # only lower triangle distances 
  #filter(sample >= b) %>%         # lower triangle distances incl. 0
  #filter(sample < b) %>%          # only upper triangle distances
  pivot_wider(
    names_from = "b",
    values_from = "distance")


# join sample_lookup (to get "sex", "animal", "day")
# where "sample" matches "sample_lookup$sample"
dist_tbl %>% 
  pivot_longer(cols = -sample, names_to = "b", values_to = "distance") %>%
  inner_join(., sample_lookup, by = "sample")
  
# join sample_lookup again
# this time on "b" column matching "sample_lookup$sample"
dist_tbl %>% 
  pivot_longer(cols = -sample, names_to = "b", values_to = "distance") %>%
  inner_join(., sample_lookup, by = "sample") %>% 
  inner_join(., sample_lookup, by = c("b" = "sample"))

# use "suffix" to make clear which columns belong to "sample" or "b"
dist_tbl %>% 
  pivot_longer(cols = -sample, names_to = "b", values_to = "distance") %>%
  inner_join(., sample_lookup, by = "sample") %>% 
  inner_join(., sample_lookup, by = c("b" = "sample"), suffix = c(".sample", ".b"))


# what different "days post weaning" do we have?
sample_lookup %>% 
  count(day) %>% 
  print(n = Inf)                   # show all rows


# filter data on "days post weaning" to be
#    - either below 10
#    - or between 141 and 150
days_wanted <- c(0:9, 141:150)

dist_tbl %>% 
  pivot_longer(cols = -sample, names_to = "b", values_to = "distance") %>%
  inner_join(., sample_lookup, by = "sample") %>% 
  inner_join(., sample_lookup, by = c("b" = "sample")) %>% 
  filter(day.x %in% days_wanted & day.y %in% days_wanted)


# now, select only the needed columns (sample, b, distance)
# and put it back to "wider format".
dist_tbl %>% 
  pivot_longer(cols = -sample, names_to = "b", values_to = "distance") %>%
  inner_join(., sample_lookup, by = "sample") %>% 
  inner_join(., sample_lookup, by = c("b" = "sample")) %>% 
  filter(day.x %in% days_wanted & day.y %in% days_wanted) %>% 
  select(sample, b, distance) %>% 
  pivot_wider(names_from = "b", values_from = "distance")

# remove the "sample" column
# and create a distance matrix
dist_matrix <- dist_tbl %>% 
  pivot_longer(cols = -sample, names_to = "b", values_to = "distance") %>%
  inner_join(., sample_lookup, by = "sample") %>% 
  inner_join(., sample_lookup, by = c("b" = "sample")) %>% 
  filter(day.x %in% days_wanted & day.y %in% days_wanted) %>% 
  select(sample, b, distance) %>% 
  pivot_wider(names_from = "b", values_from = "distance") %>% 
  select(-sample) %>% 
  as.dist()

# check our new distance matrix
str(dist_matrix)

