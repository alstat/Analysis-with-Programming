library(plot3D)

X <- seq(0, 2*pi, length.out = 50)
Y <- seq(-15, 6, length.out = 50)
M <- mesh(X, Y)
u <- M$x
v <- M$y

# x, y and z grids
x <- (1.16 ^ v) * cos(v) * (1 + cos(u))
y <- (-1.16 ^ v) * sin(v) * (1 + cos(u))
z <- (-2 * 1.16 ^ v) * (1 + sin(u))

# full colored image
par(mai = c(0.01, 0.01, 0.01, 0.01))
surf3D(x, y, z, colvar = z, 
       col = ramp.col(col = c("violet", "pink"), n = 100),
       colkey = FALSE, shade = 0.5, alpha = 0.3, expand = 1.2,
       box = FALSE, phi = 35, border = "black", theta = 70, 
       lighting = TRUE, ltheta = 560, lphi = -50)
