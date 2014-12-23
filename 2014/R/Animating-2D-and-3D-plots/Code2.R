library(animation)

saveGIF({
  for(i in 1:100){
    x <- seq(0 + (i * 0.05), 3 + (i * 0.05), length= 100)
    y <- x
    f <- function(x, y) { sin(x * y) }
    z <- outer(x, y, f)
    persp(x, y, z, theta = 45, phi = 35, expand = 0.4, col = "orange")
  }
}, interval = 0.1, ani.width = 550, ani.height = 550)
