#more functions with atomic vectors
#06 Feb 2020


# Manipulating Atomic Vectors -------------------------------------------------------------------------

#create an empty vector specifiy its mode and length 
z <- vector(mode="numeric", length = 0)
z <- c(z,5)
print(z)
#dynamic sizing don't do this in R

#preallocate space to a vector 
z <- rep(0,100) #repeats the number 0 100 times 
head(z) #gives first few numbers in sequence

# fill with NA values
z <- rep(NA,100)
print(z)
typeof(z)
z[1] <- "Washington" #changes first z character to "Washington"
typeof(z)
head(z)

v_size <- 100
my_vector <- runif(v_size) #random uniform with 100
my_names <- paste("Species", seq(1:length(my_vector)),sep="") #creates a list of 100 species with labels from 1-100
print(my_names)
names(my_vector) <- my_names
head(my_vector) #takes random numbers generated from 1-100 and matches them up with each of the 100 species names 

# Rep Functions -------------------------------------------------------------------------

#Rep function for repeating elements
rep(0.5,6) #repeats 0.5 6 times 
rep(x=0.5, times=6) #makes the code more readable
rep(times=6, x=0.5) #works the same as above as long as they are labeled 
my_vec <- c(1,2,3)
rep(x=my_vec, times=2) #repeats my_vec (1,2,3) twice 
rep(x=my_vec, each=2) #repeats each element of the vector twice
rep(x=my_vec, times=my_vec) 
rep(x=my_vec, each=my_vec) #no constant for each term, instead uses vector


# Seq functions -----------------------------------------------------------

seq(from=2, to=4) #sequence from 2 to 4 (2,3,4)
2:4 #does same thing
`:`(2,4)
seq(from=2, to=4, by=0.5) #in increments of 0.5
x <- seq(from=2, to=4, length=7) #creates 7 elements from 2 to 4
print(x)
my_vec <- 1:length(x)
print(my_vec)
seq_along(my_vec)


# Random Number Generator -------------------------------------------------

runif(5)
runif(n=5, min=100, max=110) #generates 5 random numbers between 100 and 110
rnorm(6) # 6 random normal numbers with mean 0 and s.d. 1
rnorm(n=5,mean=100,sd=30)

library(ggplot2)
z <- rnorm(1000)
qplot(x=z) #x axis is plot of random numbers, y is number of each type


# use sample function to draw random values from an existing vector 
long_vec <- seq_len(10)
print(long_vec)
sample(x=long_vec) #reshuffles all of the elements (sampling without replacement)
sample(x=long_vec, size=3) #pulls three random values from vector w/o replacement
sample(x=long_vec, size=16, replace=TRUE) #pulls out 16 elements with replacement (takes some twice)
my_weights <- c(rep(20,5), rep(100,5)) #repeats 20 5 times and 100 5 times in a single vector 
print(my_weights)
sample(x=long_vec,replace = TRUE,prob=my_weights) #last numbers are sampled more frequently because they hold more weight (100 vs. 20)


# Subsetting Atomic Vectors -----------------------------------------------

z <- c(3.1,9.2,1.3,0.4,7.5)

#subset with positive index values 
z[c(2,3)] #pulls out the 2nd and 3rd elements from the list 

#subset with negative index values
z[-c(1,5)] #gives us the 2,3,4 elements

#create a logical vector of conditions for subsetting
z[z<3] #gives elements with values less than 3

tester <- z<3
print(tester)
z[tester] #same as above code

#which function to find slots
which(z<3) #gives positions where numbers are less than three
z[which(z<3)]

#use length for relative positioning
z[-c(length(z): (length(z)-2))] #strips out last two elements

#also subset using named vector elements
names(z) <- letters[1:5] 
z #attaches a letter to each number in z
z[c("b","b")]


# Relational Operators ----------------------------------------------------
# < less than
# > greater than
# <= less than or equal 
# >= greater than or equal 
# == two elements are equal 


# Logical Operators -------------------------------------------------------

# ! NOT
# & "and" operator- applies to a vector 
# | "or" for a vector 
# xor(a,b) = a or b but not a and b 
# && and (first element) 

x <- 1:5
y <- c(1:3,7,7)
x ==2
x !=2

x==1 & y==7 #no pair of elements that meets both conditions (x is 1 and y is 7)
x==1|y==7 #x is 1 or y is 7
x==3|y==3
xor(x==3,y==3) 
x==3 && y==3 #only looking at the first element in each vector 


# Subscripting with missing values ----------------------------------------

set.seed(90)
z <- runif(10)
z
z <0.5
z[z<0.5]
which(z<0.5)
z[which(z<0.5)]

zD <- c(z,NA,NA)
zD
zD[zD<0.5]
zD[which(zD<0.5)] #drops missing values with which function 

