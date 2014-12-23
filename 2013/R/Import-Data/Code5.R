library(RCurl)
web <- "https://raw.githubusercontent.com/alstat/
        Analysis-with-Programming/master/2013/R/
        How%20to%20Enter%20Your%20Data/Data.dat"
x <- getURL(web)
y <- read.table(text = x, header = TRUE)
