AD <- function(data){
      sum(abs(data-mean(data)))/(length(data)-1)
      }
