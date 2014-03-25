var1 <- c(1, 2, 3, 4, 5, 6)
var2 <- c('a', 'b', 'c', 'd', 'e', 'f')
var3 <- c(1 + 2i, 2 + 3i, 3 + 4i, 4 + 5i, 5 + 6i, 6 + 7i)
var4 <- c(TRUE, FALSE, FALSE, TRUE, FALSE, TRUE)

df <- data.frame(var1, var2, var3, var4)
df

# OUTPUT
var1 var2 var3  var4
1    1    a 1+2i  TRUE
2    2    b 2+3i FALSE
3    3    c 3+4i FALSE
4    4    d 4+5i  TRUE
5    5    e 5+6i FALSE
6    6    f 6+7i  TRUE
