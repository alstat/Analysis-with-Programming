About the code
========================

The two functions in `server.R` for **Autocorrelation Function** (ACF) and **Partial Autocorrelation Function** (PACF), which are the following (I did some modification),

```{R}
qacf <- function(x, conf.level = 0.95, max.lag = NULL,
                 min.lag = 0) {
  ciline <- qnorm((1 - conf.level)/2)/sqrt(length(x))
  bacf <- acf(x, plot = FALSE, lag.max = max.lag)
  bacfdf <- with(bacf, data.frame(lag, acf))
  if (min.lag > 0) {
    bacfdf <- bacfdf[-seq(1, min.lag), ]
  }
  significant <- (abs(bacfdf[, 2]) > abs(ciline))^2
  bacfdf <- cbind(bacfdf, significant)
  q <- qplot(
    lag, acf, data = bacfdf, geom = "bar",
    stat = "identity", position = "identity",
    ylab = "Autocorrelation",
    fill = factor(significant))
  q <- q + geom_hline(
    yintercept = -ciline,
    color = "blue", size = 0.2)
  q <- q + geom_hline(
    yintercept = ciline,
    color = "blue", size = 0.2)
  q <- q + geom_hline(
    yintercept = 0, color = "red",
    size = 0.3)
  q <- q + scale_fill_hue(
    name = paste("Significant at the", conf.level, "level"),
    breaks = 0:1,
    labels = c("False", "True")) +
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
            face="bold"),
          legend.text = element_text(
            colour="blue",
            size = 13))
  return(q)
}

qpacf <- function(x, conf.level = 0.95, max.lag = NULL,
                  min.lag = 0) {
  ciline <- qnorm((1 - conf.level)/2)/sqrt(length(x))
  bacf <- pacf(x, plot = FALSE, lag.max = max.lag)
  bacfdf <- with(bacf, data.frame(lag, acf))
  if (min.lag > 0) {
    bacfdf <- bacfdf[-seq(1, min.lag), ]
  }
  significant <- (abs(bacfdf[, 2]) > abs(ciline))^2
  bacfdf <- cbind(bacfdf, significant)
  q <- qplot(
    lag, acf, data = bacfdf, geom = "bar",
    stat = "identity", position = "identity",
    ylab = "Autocorrelation",
    fill = factor(significant))
  q <- q + geom_hline(
    yintercept = -ciline,
    color = "blue", size = 0.2)
  q <- q + geom_hline(
    yintercept = ciline,
    color = "blue", size = 0.2)
  q <- q + geom_hline(
    yintercept = 0, color = "red",
    size = 0.3)
  q <- q + scale_fill_hue(
    name = paste("Significant at the", conf.level, "level"),
    breaks = 0:1, labels = c("False", "True")) +
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
            face="bold"),
          legend.text = element_text(
            colour="blue",
            size = 13))
  return(q)
}
```

is not mine, someone answered this on a Google groups discussion, and I just can't find a link to the discussion.
