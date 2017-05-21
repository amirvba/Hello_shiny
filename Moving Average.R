n <- 3
#FittedMA <- c(rep(NA,n-1)  ,rollmean(df$Abverkauf, n))

MovingAverage <- function(df,n) {
  FittedMA <- c(rep(NA,n)  ,head(rollmean(df$Abverkauf, n),-1))
  FittedMA %>% head()
  FittedMA %>% length()
  df %>% dim()
  df$FittedMA <- FittedMA
  return(df)
}


ExpoSmo <- function(df) {
  y <- ses(df$Abverkauf,alpha = 0.3)
  df$FittedSES <- y$fitted
  return(df)
}