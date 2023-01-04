# Code Club episode CC176 2022-01-06

# structure
str(mtcars)

# attributes
attributes(mtcars)


## get attributes

# using list notation
attributes(mtcars)$names

# using attr()
attr(mtcars, "names")

# using colnames()
colnames(mtcars)

# rownames()
rownames(mtcars)

## set attributes

attr(mtcars, "names") <- LETTERS[1:11]
mtcars

colnames(mtcars) <- letters[1:11]
mtcars


x <- 1:20
attr(x, "names")

attr(x, "names") <- letters[1:20]
attr(x, "names")
x
str(x)

names(x) <- LETTERS[1:20]
x

## remove attributes
names(x) <- NULL
x
str(x)

# change dimensions
attr(x, "dim") <- c(4, 5)
x

attr(x, "dim") <- c(10, 2)
x

dim(x)
dim(x) <- c(4, 5)
x

attr(x, "dimnames")
attr(x, "dimnames") <- list(letters[1:4], letters[1:5])
x

rownames(x) <- LETTERS[1:4]
colnames(x) <- LETTERS[1:5]
x

# custom attributes
attr(x, "created_by") <- "Stefan Schmidt"
attributes(x)
x
str(x)
