dfErros <- function(df) {
  df$Deviation <- df$Fitted - df$Abverkauf
  
  #MSD: Mean squared deviation
  df$SD <- df$Deviation ^ 2
  
  
  #MAD: Mean absolute deviation
  df$AD <- abs(df$Deviation)
  
  #MAPE: Mean absolute percentage error
  df$APE <- abs(df$Deviation) / df$Abverkauf
  
  df %>% head()
  
  return(df)
}

MyMovingAverage <- function(df, n) {
  x <- df
  y <- rep(NA, length(x))
  for (i in seq(n + 1, length(x))) {
    y[i] <- mean(x[(i - n):(i - 1)])
  }
  #return(data.frame(x,y))
  return(y)
}


MyDataReader <- function() {
  MyPath <- "C:\\Users\\amir\\Desktop\\MyData.csv"
  df <-  read.csv(MyPath, header = TRUE, sep = ";")
  return(df)
}


MyDateCleaner <- function(df) {
  df <- df %>% as.Date(format = "%d.%m.%Y")
  return(df)
}

MyShow <- function() {
  MyDF %>% str()
  writeLines("  ")
  MyDF %>% head()
}