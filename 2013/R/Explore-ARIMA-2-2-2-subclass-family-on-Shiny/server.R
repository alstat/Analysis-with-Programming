library(shiny)
library(ggplot2)

#Functions

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


shinyServer(function(input, output){
  dataset <- reactive(function(){
    if(input$ar == 1 && input$ma == 0){
      sim.ts <- arima.sim(
        n = 161, 
        model = list(
          order = c(input$ar,
                    input$df,
                    input$ma), 
          ar = input$par
        ))
    }
    if(input$ar == 2 && input$ma == 0){
      sim.ts <- arima.sim(
        n = 161, 
        model = list(
          order = c(input$ar,
                    input$df,
                    input$ma),
          ar = c(input$par, input$par2)))
    }
    if(input$ar == 0 && input$ma == 1){
      sim.ts <- arima.sim(
        n = 161, 
        model = list(
          order = c(input$ar,
                    input$df,
                    input$ma),
          ma = input$pma))
    }
    
    if(input$ar == 0 && input$ma == 2){
      sim.ts <- arima.sim(
        n = 161, 
        model = list(
          order = c(input$ar,
                    input$df,
                    input$ma),
          ma = c(input$pma, input$pma2)))
    }
    if(input$ar == 1 && input$ma == 1){
      sim.ts <- arima.sim(
        n = 161, 
        model = list(
          order = c(input$ar,
                    input$df,
                    input$ma),
          ar = input$par,
          ma = input$pma))
    }
    if(input$ar == 1 && input$ma == 2){
      sim.ts <- arima.sim(
        n = 161, 
        model = list(
          order = c(input$ar,
                    input$df,
                    input$ma),
          ar = input$par,
          ma = c(input$pma, input$pma2)))
    }
    if(input$ar == 2 && input$ma == 1){
      sim.ts <- arima.sim(
        n = 161, 
        model = list(
          order = c(input$ar,
                    input$df,
                    input$ma),
          ar = c(input$par, input$par2),
          ma = input$pma))
    }
    if(input$ar == 2 && input$ma == 2){
      sim.ts <- arima.sim(
        n = 161, 
        model = list(
          order = c(input$ar,
                    input$df,
                    input$ma),
          ar = c(input$par, input$par2),
          ma = c(input$pma, input$pma2)))
    }
    val <- as.numeric(sim.ts)
    date <- seq(as.Date("2000/01/1"), 
                as.Date(paste("2013/",05 + input$df,"/1", sep = "")), 
                by = "1 months")
    data <- data.frame(Value = val, 
                       Date = date)
    return(data)
  })
  
  dataframe <- reactive(function(){
    #a <- as.matrix(sim.ts)
    Months <- c("Jan", "Feb", "Mar", "Apr", "May", 
                "Jun", "Jul", "Aug", "Sep", "Oct", 
                "Nov", "Dec")
    b <- rep(Months, floor(length(dataset()$Value)/12))
    c <- as.character(c(b, Months[1:(length(dataset()$Value) %% 12)]))
    aa <- data.frame(dataset()$Value,c)
    
    Jan <- Feb <- Mar <- Apr <- May <- Jun <- Jul <- Aug <- Sep <- Oct <- Nov <- Dec <- numeric()
    for(i in 1:nrow(aa)){
      if(aa[i,2] == "Jan"){
        Jan[i] <- aa[i,1]
      }
      if(aa[i,2] == "Feb"){
        Feb[i] <- aa[i,1]
      }
      if(aa[i,2] == "Mar"){
        Mar[i] <- aa[i,1]
      }
      if(aa[i,2] == "Apr"){
        Apr[i] <- aa[i,1]
      }
      if(aa[i,2] == "May"){
        May[i] <- aa[i,1]
      }
      if(aa[i,2] == "Jun"){
        Jun[i] <- aa[i,1]
      }
      if(aa[i,2] == "Jul"){
        Jul[i] <- aa[i,1]
      }
      if(aa[i,2] == "Aug"){
        Aug[i] <- aa[i,1]
      }
      if(aa[i,2] == "Sep"){
        Sep[i] <- aa[i,1]
      }
      if(aa[i,2] == "Oct"){
        Oct[i] <- aa[i,1]
      }
      if(aa[i,2] == "Nov"){
        Nov[i] <- aa[i,1]
      }
      if(aa[i,2] == "Dec"){
        Dec[i] <- aa[i,1]
      }
    }
    bb <- list("Jan" = Jan[complete.cases(Jan)],
               "Feb" = Feb[complete.cases(Feb)],
               "Mar" = Mar[complete.cases(Mar)],
               "Apr" = Apr[complete.cases(Apr)],
               "May" = May[complete.cases(May)],
               "Jun" = Jun[complete.cases(Jun)],
               "Jul" = Jul[complete.cases(Jul)],
               "Aug" = Aug[complete.cases(Aug)],
               "Sep" = Sep[complete.cases(Sep)],
               "Oct" = Oct[complete.cases(Oct)],
               "Nov" = Nov[complete.cases(Nov)],
               "Dec" = Dec[complete.cases(Dec)])
    for(i in 1:length(bb)){
      if(max(sapply(bb, length)) > length(bb[[i]])){
        bb[[i]] <- c(bb[[i]],NA)
      }
    }
    
    kk <- as.data.frame(bb)
    cc <- numeric()
    for(i in 1:14){
      cc[i] <- 1999 + i
    }
    kk <- data.frame(Year = cc, kk)
    return(kk)
  })
  
  output$data.table1 <- renderDataTable(function(){
    dataframe()[,1:7]
  })
  
  output$data.table2 <- renderDataTable(function(){
    dataframe()[,c(1,8:13)]
  })
  
  estimate <- reactive(function(){
    k <- arima(
      dataset()$Val, 
      order = c(
        input$arest, 
        input$dfest, 
        input$maest),
      include.mean = FALSE)
    if(input$con){
      k <- arima(
        dataset()$Val, 
        order = c(
          input$arest, 
          input$dfest, 
          input$maest))
    }
    return(k)
  })
  
  output$est <- renderPrint(function(){
    estimate()
  })
  
  output$diagx2 <- renderPrint(function(){
    m <- Box.test(estimate()$residuals, type = input$test)
    as.numeric(as.matrix(m$statistic))
  })
  
  output$diagpv <- renderPrint(function(){
    m <- Box.test(estimate()$residuals, type = input$test)
    as.numeric(as.matrix(m$p.value))
  })
  
  output$diagdc <- renderPrint(function(){
    m <- Box.test(estimate()$residuals, type = input$test)
    j <- as.numeric(as.matrix(m$p.value))
    if(j >= 0.05){
      print("Do not reject the null hypothesis, since the p-value is greater than 0.05")
    }
    if(j < 0.05){
      print("Reject the null hypothesis, since the p-value is less than 0.05")
    }
  })
  
  output$diagcn <- renderPrint(function(){
    m <- Box.test(estimate()$residuals, type = input$test)
    j <- as.numeric(as.matrix(m$p.value))
    if(j >= 0.05){
      print("Therefore, we do not have enough evidence to reject the null hypothesis. And thus, the residuals of the model exhibits randomness")
    }
    if(j < 0.05){
      print("Therefore, the residuals of the model are not independently distributed.")
    }
  })
  
  fitted <- reactive(function(){
    dataset()$Value - estimate()$residuals
  })
  
  output$plot <- renderPlot(function(){
    p <- ggplot(dataset(), aes(x = Date, y = Value)) + geom_line(colour = "#FF5555") +
      theme(panel.background = element_rect(
        size = 3, 
        colour = "black",
        fill = "#FFFFFF"),
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
              face="bold"))
    print(p)
  })
  
  output$acf <- renderPlot(function(){
    p <- qacf(dataset()$Val)
    if(input$dfdat){
      if(input$dfd == 1){
        d <- diff(dataset()$Val, lag = 1, differences = 1)
        p <- qacf(d)
      } 
      if(input$dfd == 2){
        d <- diff(dataset()$Val, lag = 1, differences = 2)
        p <- qacf(d)
      } 
    }
    print(p)
  })
  
  output$pacf <- renderPlot(function(){    
    p <- qpacf(dataset()$Val)
    if(input$dfdat){
      if(input$dfd == 1){
        d <- diff(dataset()$Val, differences = 1)
        p <- qpacf(d)
      }
      if(input$dfd == 2){
        d <- diff(dataset()$Val, differences = 2)
        p <- qpacf(d)
      }
    }      
    print(p)
  })
  output$h.new <- renderPlot(function(){
    if(input$dfdat){
      if(input$dfd == 1){
        val1 <- diff(dataset()$Val, differences = 1)
        date1 <- seq(as.Date("2000/01/1"), 
                     as.Date(paste("2013/",5 + input$df - 1,"/1", sep ="")), 
                     by = "1 months")
        data1 <- data.frame(Value = val1, Date = date1)
        p <- ggplot(data1, aes(x = Date, y = Value)) + geom_line(colour = "#FF5555") +
          theme(panel.background = element_rect(
            size = 3, 
            colour = "black",
            fill = "#FFFFFF"),
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
                  face="bold"))
      }
      if(input$dfd == 2){
        val1 <- diff(dataset()$Val, differences = 2)
        date1 <- seq(as.Date("2000/01/1"), 
                     as.Date(paste("2013/",5 + input$df - 2,"/1", sep ="")), 
                     by = "1 months")
        data1 <- data.frame(Value = val1, Date = date1)
        p <- ggplot(data1, aes(x = Date, y = Value)) + geom_line(colour = "#FF5555") +
          theme(panel.background = element_rect(
            size = 3, 
            colour = "black",
            fill = "#FFFFFF"),
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
                  face="bold"))
      }
    }
    print(p)
  })
  
  new.data <- reactive(function(){
    data.frame(dataset(),k = estimate()$residuals)
  })
  
  output$resplot <- renderPlot(function(){
    p <- ggplot(new.data(), aes(x = Date, y = k)) + geom_line(colour = "#FF5555") +
      labs(title = "Residual's Time Plot") +
      xlab(expression(bold("Date"))) +
      ylab(expression(bold("Residuals")))  +
      theme(
        panel.background = element_rect(
          size = 3,
          colour = "black", 
          fill = "white"),
        axis.ticks = element_line(
          size = 2), 
        plot.title = element_text(
          size = 15,
          face = "bold", 
          vjust = 1.5)
      )
    print(p)
  })
  
  output$histres <- renderPlot(function(){
    p <- ggplot(data = new.data(), aes(k)) + 
      geom_histogram(binwidth = input$bin) + 
      labs(title = "Residual's Histogram") +
      xlab(expression(bold("x"))) +
      ylab(expression(bold("Count"))) +
      theme(
        panel.background = element_rect(
          size = 3, 
          colour = "black", 
          fill = "white"),
        axis.ticks = element_line(
          size = 2), 
        plot.title = element_text(
          size = 15,
          face = "bold", 
          vjust = 1.5)
      )
    if(input$yaxis == 2){
      p <- ggplot(data = new.data(), aes(k)) + 
        geom_histogram(aes(y = ..density..), 
                       binwidth = input$bin) + 
        labs(title = "Residual's Histogram") +
        xlab(expression(bold("x"))) +
        ylab(expression(bold("Density"))) +
        theme(
          panel.background = element_rect(
            size = 3, 
            colour = "black", 
            fill = "white"),
          axis.ticks = element_line(
            size = 2), 
          plot.title = element_text(
            size = 15,
            face = "bold", 
            vjust = 1.5)
        )
    }
    if(input$dens){
      p <- p + geom_density(colour = "#FF7F2A", fill = "#00FF00", alpha = 0.5)
    }
    if(input$indivobs){
      p <- p + geom_rug(colour = "RED")
    }
    print(p)
  })
  
  output$fitplot <- renderPlot(function(){
    Data <- data.frame(Date = rep(dataset()$Date, 2), Value = c(fitted(), dataset()$Value),
                       Category = c(rep("Fitted",length(fitted())),
                                    rep("Data",length(dataset()$Value))))
    p <- ggplot(data = Data, aes(Date, Value, colour = Category)) + geom_line() +
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
    print(p)
  })
})
