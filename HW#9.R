# ----------------------------------------
# HW#9: Organizing Code with Structured Programming
# 25 Mar 2020
# LKS
# ----------------------------------------
#Global Variables
library(ggplot2)
source("HW#9_FunctionTemplate.R")
n_group <- 2
n_names <- c("GAArlandia", "North America")
n_size <- c(150,150)
n_means <- c(30,10)
n_sds <- c(5,3)

# Make_data()-------------------------
Mic_data <- make_data(n_group=n_group,
                      n_names=n_names,
                      n_size=n_size,
                      n_means=n_means,
                      n_sds=n_sds)

# Run ANOVA and display graphs -------------------------
model <- calc_ANOVA()
print(model) #ANOVA Summary 
figure1 <- make_boxplot()  

# Compare distributions -------------------------
distributions <- compare_dis()


