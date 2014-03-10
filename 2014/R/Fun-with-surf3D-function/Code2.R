library(plot3D)
library(animation)

saveGIF({
  par(mai = c(0.1,0.1,0.1,0.1))
  for(i in 1:100){
    X <- seq(0, 2*pi, length.out = 100)
    Y <- seq(0, 2*pi, length.out = 100)
    M <- mesh(X, Y)
    u <- M$x
    v <- M$y
    
    # x, y and z grids
    x <- cos(u) * (3 + cos(u / 2) * sin(v) - sin(u / 2) * sin(2 * v))
    y <- sin(u) * (3 + cos(u / 2) * sin(v) - sin(u / 2) * sin(2 * v))
    z <- sin(u / 2) * sin(v) + cos(u / 2) * sin(2 * v)
    
    # full colored image
    surf3D(x, y, z, colvar = z,
           col = ramp.col(col = c("darkred", "orange"), n = 100),
           colkey = FALSE, shade = 0.5, expand = 0.5, box = FALSE, 
           phi = 40, theta = i, lighting = TRUE, ltheta = 560,
           lphi = -50)
  }
}, interval = 0.1, ani.width = 550, ani.height = 350)
