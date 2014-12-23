case2 <- function(n = 10, mu = 3, sigma = sqrt(5), p = 0.025, rep = 100){
  scaledCrit <- qnorm(p = 1 - p) * (sigma/sqrt(n))
  norm <- matrix(data = rnorm(mean = mu, sd = sigma, n = n*rep), ncol = n, nrow = rep)

  xbar <- rowMeans(norm)
  low <- xbar - scaledCrit
  up <- xbar + scaledCrit

  rem <- (mu > low) & (mu < up)
  m <- cbind(xbar, low, up, rem)

  inside <- sum(m[, 4])
  per <- inside / rep
  desc <- paste("There are ", inside, " confidence intervals that contain ",
                "the true mean (", mu, "), that is ", per, " percent of the total CIs", sep = "")
  return(list(Matrix = m, Decision = desc))
}
