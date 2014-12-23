library(Rfacebook)
library(Rook)
library(RCurl)
token <- "CAAERSN80vSQBAMaWxuitvuUG5tmE3PYprz4f00wV3wGHuQRqOjO8y9HUsLNtlEJAGpcmnUjDFdnAXWwV7pVGbONIZBAodfOGgvDZCBerLVt7z6EYlFF4ged3L0Qlt9LWjoyUx75B2AJZCWCN6cG2IEfo3tPUZAWaWPlK2ZAiyZAiV0N7gwvXZCwFGK0ZB9qCvYw41RnZCzZB1FgR0P940lc0T2OmyToqQL2ycZD"
fb_oauth <- fbOAuth(app_id = "300479656803620",app_secret = "ee1c3671c683b34ddac03261c4bb662f")
save(fb_oauth, file="fb_oauth")
me <- getUsers("me",token=fbauth)
a <- getFriends(fbauth, simplify = FALSE)
a
head(a)
a$id



#####
# Activate jpeg package
library(jpeg)
library(RCurl)
# Read jpeg image
URL <- "https://raw.githubusercontent.com/alstat/Analysis-with-Programming/master/2014/R/Image%20Analysis%20using%20EBImage/peppersalt.jpg"
Img <- getURL(URL)
Image <- download.file(URL, destfile = "Img.png", method = "curl")
dm <- dim(Image)
dm
# Assign array values to data frame rgbIMG
rgbIMG <- data.frame(
  x=rep(1:dm[2], each=dm[1]),
  y=rep(dm[1]:1, dm[2]),
  r.value=as.vector(rIMG[,,1]),
  g.value=as.vector(rIMG[,,2]),
  b.value=as.vector(rIMG[,,3]))

# Plot
plot(y ~ x, data = rgbIMG, main = expression(
  bold("University of the Philippines")),
  col = rgb(rgbIMG[c("r.value", "g.value", "b.value")]),
  asp = 1, pch = ".", xlab = "x-axis", ylab = "y-axis")

kColors <- 5

kMeans <- kmeans(rgbIMG[, c("r.value", "g.value", "b.value")],
                 centers = kColors)
           
clusterColour <- rgb(kMeans$centers[kMeans$cluster,])
 
plot(y ~ x, data = rgbIMG, main = expression(
  bold("University of the Philippines")),
  col = clusterColour, asp = 1, pch = ".", ylab = "",
  xlab = "k-Means Cluster Analysis of 5 Colours")
