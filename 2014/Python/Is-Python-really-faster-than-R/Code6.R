case3 <- function(n = 10, mu = 3, sigma = sqrt(5), p = 0.025, rep = 100){
  xbar <- rowMeans(
    matrix(rnorm(mean = mu, sd = sigma, n = n*rep),nrow=rep)
  )

  q <- qnorm(p = 1 - p) * (sigma/sqrt(n))
  m <- data.frame(
    xbar,
    low=xbar+q,
    high=xbar-q,
    rem= abs(mu-xbar) < q )

  inside <- sum(m$rem)
  per <- inside / rep
  desc <- paste("There are ", inside, " confidence intervals that contain ",
                "the true mean (", mu, "), that is ", per, " percent of the total CIs", sep = "")
  return(list(Matrix = m, Decision = desc))
}
