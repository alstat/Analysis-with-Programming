scores <- c(84, 93, 101, 86, 82, 86, 88, 94, 89, 94, 93, 83, 95, 86, 94, 87,
            91, 96, 89, 79, 99, 98, 81, 80, 88, 100, 90, 100, 81, 98, 87, 95, 94)

#For 95% Confidence Interval

library(BSDA)
z.test(scores, sigma.x = 6.8)

         One-sample z-Test

data: scores
z = 76.3126, p-value < 2.2e-16
alternative hypothesis: true mean is not equal to 0
95 percent confidence interval:
  88.01327 92.65340
sample estimates:
  mean of x
90.33333

#For 99% Confidence Interval

z.test(scores, sigma.x = 6.8, conf.level = 0.99)

         One-sample z-Test

data: scores
z = 76.3126, p-value < 2.2e-16
alternative hypothesis: true mean is not equal to 0
99 percent confidence interval:
  87.28425 93.38241
sample estimates:
  mean of x
90.33333 
