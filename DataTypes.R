# Basic examples of data types and their uses
# February 2, 2020
# LKS

# -------------------------------------------------------------------------

# Using the assignment operator 
x <- 5 # preffered 
y = 4 #legal but not used expect in function defaults
y <- y+1
y 
print(y) #prints variable output to console in any environment

# -------------------------------------------------------------------------

#Variable names
z <-3 #use lower case
plantHeight <-3 #camel case naming
plant.height <-3 #avoid! periods
plant_height <-3 #snake case *preffered*
. <- 5 #use exclusively for temporary variables 

# -------------------------------------------------------------------------

#combine or concatenate function
z <- c(3.2,2,5,5,6)
print(z)
typeof(z)
is.numeric(z)
is.character(z)

# character variable bracketed by quotes (single or double)
z <- c("perch", "striped bass", "trout")
z
z <- c("this is one'character string'", "and another")
print(z)

z <- c(TRUE,FALSE,FALSE)
typeof(z)

# -------------------------------------------------------------------------

#Properties of atomic vectors
#has a unique type
typeof(z)
is.logical(z)

#has a specified length
length(z)
length(zz)

#optional names
z <- runif(5)
print(z)
names(z)
names(z) <- c("chow", 
              "pug", 
              "beagle", 
              "greyhound", 
              "akita") #pairs names with numbers associated with z 
print(z)
z[3] #returns third element in list #single element
z[c(3,4)] #pulls out third and fourth element in list 
z[c(3,3,3)] #beagle beagle beagle 

#add names when variable is first built (with or without quotes)
z2 <- c(gold=3.3, silver=10, lead=2)
print(z2)
# to reset names
names(z2) <- NULL

#name some elements, but not others
names(z2) <- c("copper", "zinc")
print(z2)

# -------------------------------------------------------------------------

# NA for missing data 
z <- c(3.2, 3.3, NA)
typeof(z)
length(z)
typeof(z[3])
z1 <-NA
typeof(z1)
is.na(z) #boolean to find NA
!is.na(z) #boolean to find NOT NA
mean(z)
mean(!is.na(z)) #not correct operates on booleans
mean(z[!is.na(z)]) # correct- find means of not NA

#NaN (not a number), -Inf, Inf from numeric division 
z <- 0/0
print(z) #NaN value
is.nan(z)
typeof(z)
z <- 1/0     
print(z) #positive infinity value
z <- -1/0
print(z) #negative infinity value


#null is nothing
z <- NULL
typeof(z)
length(z) #length 0
is.null(z)

#all atomics are the same type
#if elements are different, R coerces them 
# logical > integer > double > character

z <- c(0.1, 5, "0.2")
typeof(z)
print(z)

#use coercion for useful calculations
a <- runif(10)
print(a)
a > 0.5
sum(a > 0.5) #how many values greater than 0.5
mean(a >0.7) #proportion of values greater than 0.7

# in a normal distribution, approximately what perent of observations from a normal (0,1) are larger than 2.0

mean(rnorm(100000) >2)


# -------------------------------------------------------------------------

#Vectorization 
z <- c(10, 20, 30)
z + 1 #adds one to each vector element
z2 <- c(1,2,3)
z + z2
z^2 #squares each element in vector z

# -------------------------------------------------------------------------


#Recycling
z <- c(10, 20, 30)
z2 <- c(1,2) #vectors are different lengths
z + z2
