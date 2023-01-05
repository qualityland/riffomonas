# Code Club episode CC177 2022-01-10

# define a function
c_to_f <- function(celsius)
  9 / 5 * celsius + 32

# call the function
c_to_f(celsius=20)
c_to_f(20)

# add 2nd argument
c_to_f <- function(celsius, freezing)
  9 / 5 * celsius + freezing

c_to_f(20, 32)
# named arguments
c_to_f(freezing = 32, 20)

# default value
c_to_f <- function(celsius, freezing = 32)
  9 / 5 * celsius + freezing

c_to_f(20)

# more complicated function
c_to_f <- function(celsius, freezing=32){
  multiplication <- 9 / 5 * celsius
  f <- multiplication + freezing
  return(f)
}

c_to_f(20)
