stcenter <- function(data){
  if(nrow(data) == 0L)
    stop("data must have one or more observations")
  if(ncol(data) == 1L)
    stop("data must have at least 2 locations")
  row <- dim(data)[1L]
  col <- dim(data)[2L]
  mat <- matrix(NA, nrow = row, ncol = col)
  for(j in 1L:col){
    mat[, j] <- data[, j] - mean(data[, j])      
  }  
  return(as.data.frame(mat))
}
