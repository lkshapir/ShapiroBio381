
# Uniform Distribution-----------------------------------------------------------------
library(ggplot2)
qplot(x=runif(n=100,min=1,max=6),
              color=I("black"),
              fill=I("plum3"))
qplot(x=sample(1:6,size=1000,replace=TRUE))


# Normal Distribution -----------------------------------------------------

my_norm <- rnorm(n=100,mean=100,sd=2)
qplot(x=my_norm,
      color=I("black"),
      fill=I("plum3"))

# problems where mean is too small
my_norm <- rnorm(n=100,mean=2,sd=2)
qplot(x=my_norm,
      color=I("black"),
      fill=I("purple")) #values go below zero!
toss_zeroes <- my_norm[my_norm>0]
qplot(x=toss_zeroes,
      color=I("black"),
      fill=I("purple"))
mean(toss_zeroes)
sd(toss_zeroes)


# Gamma Distribution ------------------------------------------------------

# use for continuous data greater than zero 
my_gamma <- rgamma(n=100,shape=1,scale=10)
qplot(x=my_gamma,
      color=I("black"),
      fill=I("purple"))
# gamma with shape =1 is exponential with scale =mean 
my_gamma <- rgamma(n=100,shape=1,scale=0.1) #avg of 0.1
qplot(x=my_gamma,
      color=I("black"),
      fill=I("purple"))
# increasing the shape parameter distribution looks more normal 
my_gamma <- rgamma(n=100,shape=20,scale=1)
qplot(x=my_gamma,
      color=I("black"),
      fill=I("purple"))
# scale parameter changes both the mean and the variance! 
# mean = shape * scale 
# variance = (shape*scale)^2


# Beta Distribution -------------------------------------------------------

#continuous, but bounded between 0 and 1 (good for looking at probability dist.)

#analogous to binomial, but with a continous distribution of possible values 

#p((data)parameters)
#Bayesian: p(parameters(data)) #probability of the parameters given the data = maximum likelihood estimator of parameters

#shape1= number of successes + 1
#shape2= number of failures + 1 

my_beta <- rbeta(n=1000,shape1=2,shape2=1) #biased towards heads (3 heads and no tails)
qplot(x=my_beta,
      color=I("black"),
      fill=I("plum3"))
#shape and scale less than 1.0 gives u-shaped curve 
my_beta <- rbeta(n=1000,shape1=0.2,shape2=0.1)
qplot(x=my_beta,
      color=I("black"),
      fill=I("plum3")) # probability peaks on edges of dist. 

# Maximum Likelihood ------------------------------------------------------

#Estimate parameters from data 
x <- rnorm(1000,mean=92.5,sd=2.5)
qplot(x=x,
      color=I("black"),
      fill=I("plum3"))
library(MASS)

fitdistr(x,"normal")#data, distribution we are fitting to- gives us mean and sd
fitdistr(x,"gamma") #gives us shape and rate parameters from data
# simulate gamma using those parameters to test 

x_sim <- rgamma(n=1000,shape=1277,rate=13.8)
qplot(x=x_sim,
      color=I("black"),
      fill=I("plum3"))#looks pretty similar to data we had, should use gamma dist, fits data well 


