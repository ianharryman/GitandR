# I'm working through the Functional Programming section of datachallenge
v <- c(1, 2.7, 4, 5) # this is a standard vector
v_named <- c(guava = 2, pineapple = 4, dragonfruit = 1) # this is a vector with named elements

# subsetting vectors based on position
v[c(1, 2)]
# this selects the first and second position

# subsetting a range of positions in order
v[c(1:3)]

# we can also remove elements of the vector based on position
v[-c(1,3)]

# we can also subset with characters
v_named[c("guava", "pineapple")]

# you can also select elements using T and F. Brackets will select the TRUE elements you provide
v[c(TRUE, FALSE, TRUE, FALSE)]
# this will select the first and third elements in the vector

#subsetting based on the values greater than 2
v[v >2]


# now let's look at how to analyze vectors with NAs
v_missing <- c(1.1, NA, 5, 6, NA)

# extracting all non-missing elements
v_missing[!is.na(v_missing)]

# you can select single elements with double brackets
v[[2]]

# if you are doing this with named vectors, you can select the name or the value of the name
# by using either one or two brackets
v_named["guava"]
v_named[["guava"]]



# now working on Tibbles
# tibbles are just another type of list
# they just have several lists of the same length that 
# pretty much look like a dataframe

# you can make your own tibble
library(tidyverse)

my_tibble <- 
  tibble(
    x = c(1,9,5),
    y = c(T,F,F),
    z = c("apple", "pear", "bannana")
  )
my_tibble



