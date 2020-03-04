# Experimental Design 
# February 20 2020


# #Regression Analysis ----------------------------------------------------

#Continuous independant and dependant variables 

#Create fake data frame
n <- 50 # number of observations (rows of data)
var_a <- runif(n) #50 random uniforms (independant)
var_b <- runif(n) # dependant variable
var_c <- 5.5 + var_a*10 #build noisy linear relationship 
id <- seq_len(n) #creates a sequence from 1 to n 
reg_df <- data.frame(id,var_a,var_b,var_c)
str(reg_df)
head(reg_df)

#Regression model 
reg_model <- lm(var_b~var_a, data=reg_df) #grabs data from columns of data frame
reg_model
str(reg_model)
head(reg_model$residuals)

#summary of model is what we usually want
summary(reg_model)
summary(reg_model$coefficients)


z <- unlist(summary(reg_model))
z

reg_sum <- list(intercept=z$coefficients1,
                slope=z$coefficients2,
                intercept_p=z$coefficients7,
                slope_p=z$coefficients8,
                r2=z$r.squared)
reg_sum$intercept

#regression plot for data 
reg_plot <- ggplot(data=reg_df,
                   aes(x=var_a,y=var_b)) + 
                   geom_point() +
                   stat_smooth(method=lm,se=0.95)
print(reg_plot)


# Basic ANOVA Model -------------------------------------------------------

n_group <- 3 # number of treatment groups
n_name <- c("Control","Treatment1","Treatment2")
n_size <- c(12,17,9) #number of observations in three groups 
n_mean <- c(40,41,60) #avg response variables in each group 
n_sd <- c(5,5,5)
t_group <- rep(n_name,n_size)
t_group 
table(t_group)

id <- 1:(sum(n_size))
res_var <- c(rnorm(n=n_size[1],mean=n_mean[1],sd=n_sd[1]),rnorm(n=n_size[1],mean=n_mean[1],sd=n_sd[1]))
ano_data <- data.frame(id,t_group,res_var)
str(ano_data)
