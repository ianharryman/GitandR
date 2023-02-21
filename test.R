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


# Now we're going to try our hands at a function

# this is an if-else statement, but one that does not use the ifelse command
recommend_1 <- function(x){
  if (x >= 90) {
    "locate air conditioning"
  } else if (x >= 60){
    "go outside"
  } else if (x >= 30) {
    "wear a jacket"
  } else {
    "move"
  }
}

recommend_1(92)
recommend_1(20)
recommend_1(49)


# Now lets move on to mutate:

# Mutate will create a new column, but the vector length has to match the rest of the tibble
set.seed(128)

df <- tibble(temperature = sample(x = -15:110, size = 5, replace = TRUE))

# adding a column
df %>%
  mutate(new_column = c(1,2,3,4,5))

# you can add a column with only one value listed and the mutate 
# command will replace all values with that value
df %>%
  mutate(new_column = 1)


# often, you will create new columns by applying functions to existing ones
f_to_c <- function(degrees_fahrenheit){
  (degrees_fahrenheit - 32) * (5/9)
}

# now lets apply the function
df %>%
  mutate(temperature_celcius = f_to_c(temperature))

# one of the problems with mutate is that it can't handle 
# a vector of values wihtout specifically defining each row
temps <- c(1, 55, 101)
recommend_1(temps)
# so we need to create a function to deal with this

# use the case_when function in lieu of a nested ifelse
recommendation_2 <- function(x){
  case_when(
    x >= 90 ~ "locate air conditioning",
    x >= 60 ~ "go outside",
    x >= 30 ~ "wear a jacket",
    x >= 0  ~ "wear multiple jackets",
    TRUE    ~ "move"
  )
}

recommendation_2(temps)
# much better

# now we can create a new column that inputs the values
# for each row
df %>%
  mutate(recommendation = recommendation_2(temperature))



# here's an example of a simple function
kilometers_to_miles <- function(x){
  x * 0.62
}

kilometers_to_miles(10)


