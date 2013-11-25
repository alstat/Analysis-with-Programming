#Load the packages
library(ggplot2)
library(maptools)
library(OpenStreetMap)

#Import the data
text <- download.file("https://raw.github.com/alstat/Analysis-with-Programming/master/2013/R/R-Mapping-Super-Typhoon-Yolanda-Haiyan-Track/TyDatYolanda2013.csv",
                      destfile = "/tmp/test.csv", method = "curl")
tydat <- read.csv("/tmp/test.csv", header = TRUE)

#Obtain the Map
map <- openmap(c(27.605671,103.256834),
               c(1.757537,150.4541),
               minNumTiles=4,type="mapquest-aerial",zoom = 6)

map <- openproj(map)

#Convert mph to knot
tydat$MaxSpeed <- tydat$MaxSpeed * 0.868976

#Plot the map with data points
p <- autoplot(map) +
  geom_point(data = tydat, 
             aes(x = CLongitude, 
                 y = CLatitude),
             alpha = 0.5,
             colour = "orange",
             size = 2) + 
  geom_point(data = tydat, 
             aes(x = CLongitude, 
                 y = CLatitude),
             alpha = 0.3,
             colour = "white",
             size = tydat$MaxSpeed*0.4) + 
  geom_path(data = tydat, 
            aes(x = CLongitude, 
                y = CLatitude),
            alpha = 0.7,
            colour = "orange") + 
  geom_point(data = tydat, 
             aes(x = CLongitude, 
                 y = CLatitude),
             alpha = 0.5,
             colour = "yellow",
             size = tydat$MaxSpeed*0.25) +
  geom_point(data = tydat, 
             aes(x = CLongitude, 
                 y = CLatitude,
                 colour = MaxSpeed),
             alpha = 0.6,
             size = tydat$MaxSpeed*0.2) +
  scale_colour_gradient(
    name = "Wind Speed (Knot)",
    low = "yellow", 
    high = "red") +
  geom_text(data = tydat, 
            aes(x = CLongitude, 
                y = CLatitude,
                label = Category,
                family = "serif",
                fontface = "bold"),
            colour = "white",
            size = rel(3.5)) +
  labs(title = "Super Typhoon | Yolanda (Haiyan) | November 3 - 11, 2013") +
  xlab(expression(bold("Longitude"))) + 
  ylab(expression(bold("Latitude")))  +
  theme(panel.background = element_rect(
    size = 3, 
    colour = "black",
    fill = "white"),
        axis.ticks = element_line(
          size = 2),
        axis.title.x = element_text(
          size = rel(1.2), 
          face = "bold"),
        axis.title.y = element_text(
          size = rel(1.2), 
          face = "bold"),
        plot.title = element_text(
          size = 20,
          face = "bold", 
          vjust = 1.5),
        legend.position = "bottom",
        legend.title = element_text(
          size=rel(1.2), 
          face="bold")) + 
  coord_fixed()
p
