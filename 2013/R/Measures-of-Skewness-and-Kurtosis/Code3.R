#Simulation
n.sample <- rnorm(n = 10000, mean = 55, sd = 4.5)

#Skewness and Kurtosis
library(moments)
skewness(n.sample)

[1] -0.008525844

kurtosis(n.sample)

[1] 2.96577

#Histogram
library(ggplot2)
datasim <- data.frame(n.sample)
ggplot(datasim, aes(x = n.sample), binwidth = 2) +
  geom_histogram(aes(y = ..density..), fill = 'red', alpha = 0.5) +
  geom_density(colour = 'blue') + xlab(expression(bold('Simulated Samples'))) +
  ylab(expression(bold('Density')))
