library(animation)

saveGIF({
  for(i in 1:100){
    curve(sin(x), from = -5 + (i * 0.05), to = 5 + (i * 0.05), col = "red", ylab = "")
    curve(cos(x), from = -5 + (i * 0.05), to = 5 + (i * 0.05), add = TRUE, col = "blue", ylab = "")
    legend("topright", legend = c("sin(x)", "cos(x)"), fill = c("red", "blue"), bty = "n")
  }
}, interval = 0.1, ani.width = 550, ani.height = 350)
