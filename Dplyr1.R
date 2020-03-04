## Manipulating Data using dplyr
## LKS
## 3/4/2020

library(tidyverse)

## What is dplyr?
## new-ish package: provides a set of tools for manipulating data 
# part of the tidyverse: collection of packages that share philosophy, grammar, and data structure 
# specifically written to be fast!
# individual functions that correspond to the most common operations
# easier to figure out what you want to do with your data 

library(dplyr)

### Core verbs
# filter() #rows
# arrange()
# select() # columns
# summarize() and group_by()
# mutate()

data(starwars)
class(starwars) 
# What is a tibble?
# "modern take" on data frames- keeps great aspects of the data frames and drop the frustrating ones (changing the variable names, changing input type)

glimpse(starwars)
head(starwars)

# clean up data
# complete.cases not part of dplyr

starwarsClean <- starwars[complete.cases(starwars[,1:10]),] #get rid of NA's
is.na(starwarsClean[,1])
anyNA(starwarsClean) #No NA's!

#What does our data look like?
glimpse(starwarsClean)
head(starwarsClean)

# Filter ------------------------------------------------------------------


## filter(): pick/subset observations by their values
### uses >, >=, <, <=, !=, == for comparisons
## logical operators: & ! 
## filter automatically excludes NA's

filter(starwarsClean, gender=="male", height <180, height > 100) #filter for males between 100-180 in height, multiple conditions for the same variable

filter(starwarsClean, eye_color %in% c("blue","brown"))
# either have blue or brown eyes (%in% means either or)


# Arrange -----------------------------------------------------------------


## arrange(): reorders rows
arrange(starwarsClean, by=height)
# default, in ascending order
arrange(starwarsClean, by=desc(height))
# descending, changes order

arrange(starwarsClean, height, desc(mass))
# shortest to tallest, if they have the same height, put more massive first
# add additional argument to break ties in preceding column 

starwars1 <- arrange(starwars, height)
tail(starwars1) #missing values are at the end 

# select(): choose variables by their names
starwarsClean[1:10,2] # base r- selecting the seconf variable

select(starwarsClean, 1:5) #selects first five columns
select(starwarsClean, name:species) #selects columns from name to species (use varirble names too)

select(starwarsClean, -(films:starships)) #removes columns from films to starships


#   -----------------------------------------------------


#rearrange columns

select(starwarsClean, name, gender, species, everything()) #puts columns in this order [everything after these columns is in same order

select(starwarsClean, contains("color")) #Finds columns with variables with same word (ex: hair_color, skin_color, eye_color) other helpers: ends_with, starts_with, matches (reg ex), num_range

## rename columns
select(starwars, haircolor = hair_color, films) #renamed hair_color as haircolor

##rename function
rename(starwarsClean, haircolor=hair_color)


# Mutate ------------------------------------------------------------------
# Creates new variables with functions of existing variables 

mutate(starwarsClean, ratio= height/mass) # we can use arithmetic operators #last column is now ratio, calculated by dividing height by mass in each row 

starwars_lbs <- mutate(starwarsClean, mass_lbs = mass*2.2) #change kg to lbs
select(starwars_lbs, 1:3, mass_lbs, everything())

#transmute - just keeps new variable 
transmute(starwarsClean, mass_lbs = mass*2.2)

transmute(starwarsClean, mass_lbs = mass*2.2,mass)
# shows last two columns


# Summarize and Group By --------------------------------------------------

#summarize and group by collapses values down to a single summary
summarize(starwarsClean, meanHeight= mean(height))

## Working with Na's
summarize(starwars, meanHeight=mean(height))
#spits out NA's 
summarize(starwars, meanHeight=mean(height, na.rm=TRUE)) #fixed
summarize(starwars, meanHeight=mean(height, na.rm=TRUE), TotalNumber=n())
#87 numbers were used in this calculation (sample size)

starwarsGenders <- group_by(starwars,gender)
head(starwarsGenders)
#Adds a "group" component, there are three groups by gender

summarize(starwarsGenders, meanHeight=mean(height, na.rm = TRUE), number=n())
#Shows genders, their corresponding heights and the number in each group 


# Piping ------------------------------------------------------------------
#used to emphasize a sequence of actions 
# passes an intermediate result onto next function (takes output of one staement and makes it the input of the next statement)
# avoid if you have meaningful intermediate results, or if you want to manipulate more than one object

starwarsClean %>%
  group_by(gender) %>%
  summarize(meanHeight = mean(height), 
            number=n())
