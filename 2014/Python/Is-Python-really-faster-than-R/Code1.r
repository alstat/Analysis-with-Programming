case <- function(n = 10, mu = 3, sigma = sqrt(5), p = 0.025, rep = 100){
  m <- matrix(NA, nrow = rep, ncol = 4)
  for(i in 1:rep){
    norm <- rnorm(mean = mu, sd = sigma, n = n)
    xbar <- mean(norm)
    low <- xbar - qnorm(p = 1 - p) * (sigma/sqrt(n))
    up <- xbar + qnorm(p = 1 - p) * (sigma/sqrt(n))
  
    if((mu > low) && (mu < up)){
      rem <- 1
    } else {
      rem <- 0
    }
    
    m[i, ] <- c(xbar, low, up, rem)
  }
  
  inside <- sum(m[, 4])
  per <- inside / rep
  desc <- paste("There are ", inside, " confidence intervals that contain ",
                "the true mean (", mu, "), that is ", per, " percent of the total CIs", sep = "")
  return(list(Matrix = m, Decision = desc))
}
