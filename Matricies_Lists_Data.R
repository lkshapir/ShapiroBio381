# Working with matrices, lits and data frame
# 11 February 2020
# LKS


# -------------------------------------------------------------------------

library(ggplot2)


# Matrices ----------------------------------------------------------------
# a matrix is just an atomic vector, reorganized into two dimensions 
# create a matrix with matrix function 
m <- matrix(data=1:12,nrow=4,ncol=3) #creates a matrix of numbers from 1 to 12 with 4 rows and three columns
print(m)
m <- matrix(data=1:12, nrow=4)

#use byrow=TRUE to change filling direction 
m <- matrix(data=1:12,nrow=4,byrow=TRUE) #fills matrix line by line 
print(m)

# use dim() function 
dim(m) #first number is rows, second is columns 

#change dimension of matrix 
dim(m) <- c(6,2) #product has to equal length of atomic vector 
print(m)
dim(m) <- c(4,3) #sets back to 4 and 3
print(m)

#individual row and column dimensions = same as dim function 
nrow(m)
ncol(m)

# length of atomic vector is still there 
length(m)

# add names to matrix 
rownames(m) <- c("a","b","c","d")
print(m)
colnames(m) <- LETTERS[1:ncol(m)] #assigns letters up to the number of columns in matrix m 
print(m)
rownames(m) <- letters[nrow(m):1] #same labels but in reverse order 
print(m)

# grabbing an entire atomic vector 
z <- runif(3)
z[]

# specify rows and columns, separated by a comma 
m[2,3] #picks number from row 2, column 3
print(m)

#choose row 2 and all columns 
m[2,] #all numbers in second row
m[,3] # all numbers in third column

#print everything
print(m)
print(m[])
print(m[,])

dimnames(m) <- list(paste("Site",1:nrow(m),sep = ""),
                    paste("Species",1:ncol(m),sep ="_"))
print(m)

#transpose a matrix 
m2 <- t(m) #reverse rows and columns
print(m2)

# add a row to matrix with rbind()
m2 <- rbind(m2,c(10,20,30,40))
print(m2) 
rownames(m2)

# call the function to get the atomic 
rownames(m2)[4] <- "myfix" #renames 4th row as "myfix" 
rownames(m2)
print(m2)

# access rows and columns with names as well as index numbers
m2["myfix","Site3"]
m2[4,3]
m2[c("myfix","Species_1"),c("Site2","Site2")] #repeats site 2 column twice

#cbind() will add a column to a matrix 

#change a matrix back to a vector 
my_vec <- as.vector(m)
print(my_vec)


# Lists -------------------------------------------------------------------

#Lists are like atomic vectors (1-dimensional) but each element can hold different things of different types and sizes
 
my_list <- list(1:10,
                matrix(1:8,nrow=4,byrow=TRUE),
                letters[1:3],
                pi)
str(my_list) #shows components of list 

#try grabbing one of the list components
my_list[4]
my_list[4]-3 #ERROR!
typeof(my_list[4])

# single brackets always return a list from a list!
typeof(my_list[[4]])

#double bracket always extracts a single element of the correct type 

my_list[[4]] -3 #Works 
# if a list has 10 elements it is like a train with 10 cars
# [[5]] gives me the contents of car 5
# [c(4,5,6)] gives me a little train with cars 4,5,6 linked together 
# [5] gives me a train with one car 
# Use double brackets to see the element that is inside the car!

my_list[[2]][2,2] #second command will call number in a position in that matrix, since the second element of the list is a matrix 

#name list items as we create them 
my_list2 <- list(Tester=FALSE, 
                 little_m=matrix(runif(9),nrow=3))
print(my_list2)

my_list2$little_m[2,3] #takes second row third column of matrix named "little_m"
my_list2$little_m #takes whole matrix 
t(my_list2$little_m) #flips rows and columns- t only works on matrix
my_list2$little_m[2,]
my_list2$little_m[2] 


#using a list to access output from a linear model 
y_var <- runif(10)
x_var <- runif(10)
my_model <- lm(y_var~x_var)
qplot(x=x_var, y=y_var)
print(my_model)
summary(my_model)
str(summary(my_model))

# use the unlist() function to flatten the output 
z <- unlist(summary(my_model),recursive = TRUE) #recursive=TRUE, unroll sublists inside vector 
print(z)
my_slope <- z$coefficients2
my_pval <- z$coefficients8
print(c(my_slope,my_pval))

# Data Frames -------------------------------------------------------------

#data frames are lists of equal-lenghted vectors, each of which is a column in a data frame. 

#a data frame differs from the matrix only in that different columns may be of different data types 

var_a <- 1:12
var_b <- rep(c("Con","LowN","HighN"),each=4)
var_c <- runif(12)
d_frame <- data.frame(var_a,var_b,var_c,stringsAsFactors = FALSE)
print(d_frame)
head(d_frame)
str(d_frame)

#Adding a row to data frame as a formatted list
new_data <- list(var_a=13,var_b="HighN",var_c=0.668)
str(new_data)
d_frame <- rbind(d_frame,new_data)
print(d_frame)

#Adding a column (easier bc it's one data type)
new_var <- runif(nrow(d_frame))
d_frame <- cbind(d_frame, new_var)
head(d_frame)
