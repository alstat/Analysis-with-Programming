library(animation)

saveGIF({
  for(i in 1:150){
    x <- seq(-6 + (i * 0.05), 6 + (i * 0.05), length= 100)
    y <- x
    f <- function(x, y) { sin(x) + cos(y) }
    z <- outer(x, y, f)
    persp(x, y, z, theta = 45 + (i * 0.5), phi = 35, expand = 0.4, col = "lightblue")
  }
}, interval = 0.1, ani.width = 550, ani.height = 550)
