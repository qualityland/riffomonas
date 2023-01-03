# Code Club episode CC175 2022-01-03



# if else, ifelse() and if_else()

# vector-based:
#   - if_else (dplyr)
#   - ifelse (baseR)

## ifelse()
x <- c(1:10, NA, 12:20)
ifelse(x %% 2 == 1, "odd", "even")

library (dplyr)

# if_else()
if_else(x %% 2 == 1, "odd", "even", "missing")
