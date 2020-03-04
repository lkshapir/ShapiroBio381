#Probability Distributions
#February 18 2020

# d = probability density function
# p = cumulative probabilty function
# q = quantile function (inverse of p function)
# r = random number generator from specified distribution 

library(ggplot2)
library(MASS)


# Poisson Distribution ----------------------------------------------------

# discrete distribution (min 0 to max infinity)
# parameter lambda > 0 (continuous)
  # constant rate parameter (observations per unit time or unit area)

# d function for probability density (dpois for density poisson)
hits <- 0:10
my_vec <- dpois(x=hits,lambda = 1)
qplot(x=hits,
      y=my_vec, 
      geom="col",
      color=I("black"),
      fill=I("orange"))


my_vec <- dpois(x=hits,lambda = 4.4) #increase value of lambda
qplot(x=hits,
      y=my_vec, 
      geom="col",
      color=I("red"),
      fill=I("orange"))

#as lambda increases, looks more like normal distribution (sampling more hits per unit time)

sum(my_vec) #should be 1.0

# for a poisson with lambda=2, 
# what is the probability that a single draw 
# will yield x=0
dpois(x=0,lambda = 2) 

hits <- 0:10
my_vec <- ppois(q=hits,lambda = 2)
qplot(x=hits,
      y=my_vec, 
      geom="col",
      color=I("black"),
      fill=I("orange"))

# for poisson with lambda=2
# what is the probability that a single random draw 
# will yield x <=1

ppois(q=1,lambda = 2)

p1 <- dpois(x=1,lambda = 2)
print(p1)
p2 <- dpois(x=0, lambda = 2)
print(p2)

p1 + p2 #same probability using the d function 
        #probability of getting a 0 + probability of getting 1

# the q funtion is the inverse of p 
qpois(p=0.5,lambda=2.5)

#simulate a poisson to get actual values 
ran_pois <- rpois(n=1000,lambda = 2.5) # creates random poisson distribution
qplot(x=ran_pois,
      color=I("black"),
      fill=I("orange"))
quantile(x=ran_pois,probs = c(0.025,0.975)) #95% confidence interval for our simulated values (5% outside)


# Binomial Distribution ---------------------------------------------------

# p = probability of dichotomous outcome (yes/no etc...), between 0-1
# size = number of trials 
# x = possible outcomes 
# outcome x is bounded between 0 and size 

# density function for binomial 
hits <- 0:10
my_vec <- dbinom(x=hits,size=10,prob=0.5)
qplot(x=hits,
      y=my_vec, 
      geom="col",
      color=I("black"),
      fill=I("orange")) #symmetric distribution 

# what is the probability of getting 5 heads out of 10 tosses 
dbinom(x=5,size=10,prob=0.5) #High probabilities of getting 4 or 6 heads also, so lower than 0.5

#biased coin
hits <- 0:10
my_vec <- dbinom(x=hits,size=10,prob=0.17) 
qplot(x=0:10,
      y=my_vec, 
      geom="col",
      color=I("purple"),
      fill=I("purple"))

# p function for tail probability 
# probability of 5 or fewer heads
# out of 10 tosses
pbinom(q=5,size=10,prob=0.5) #little more than 0.5, accounts for 0 category 

#What is a 95% confidence interval for 100 trials with p=0.7
qbinom(p=c(0.025,0.975),
       size=100,
       prob=0.7) #will find between 61 and 79 heads out of 100 trials (not exactly 70)
my_coins <- rbinom(n=50,
                   size=100,
                   prob=0.50)
qplot(x=my_coins,
      color=I("black"),
      fill=I("purple"))
quantile(x=my_coins,probs=c(0.025,0.975))


# Negative Binomial Distribution  ------------------------------------------------------

# More "realistic" version of the poisson 
# Number of failures of (Bernouli) with p= probability of success 
# Before a targeted number of successes (=size)
# Generates a more distribution that is more heterogenous ("overdispersed") than the poisson

hits <- 0:40
my_vec <- dnbinom(x=hits,
                  size=5,
                  prob=0.5) #How many tails will I get until I accumulate 5 heads on a fair coin 
qplot(x=hits,
      y=my_vec,
      geom="col",
      color=I("black"),
      fill=I("purple"))

# geometric series is a special case 
# where the number of successes = 1
# each bar is a constant fraction of the one that came before 
# it with probability of 1-p

my_vec <- dnbinom(x=hits,
                  size=1,
                  prob=0.1)
qplot(x=hits,
      y=my_vec,
      geom="col",
      color=I("black"),
      fill=I("purple")) #Each bar is 90% as high as the previous bar # alternatively specify mean=mu of distribution and size 
# this gives us a poisson distribution with a lambda value that varies 
# dispersion parameter is the shape parameter from a gamma distribution. As it increases, the distribution of the variance gets smaller

nbi_ran <- rnbinom(n=1000,size=10,mu=5) #mu=mean
qplot(nbi_ran,
      color=I("black"),
      fill=I("purple"))

nbi_ran <- rnbinom(n=1000,size=0.1,mu=5) #mu=mean
qplot(nbi_ran,
      color=I("black"),
      fill=I("purple"))









