#FittedMA <- c(rep(NA,n-1)  ,rollmean(df$Abverkauf, n))

MovingAverage <- function(df,n) {
  FittedMA <- c(rep(NA,n)  ,head(rollmean(df$Abverkauf, n),-1))
  FittedMA %>% head()
  FittedMA %>% length()
  df %>% dim()
  df$FittedMA <- FittedMA
  return(df)
}


MyDF <- MyDF %>% get__Weeklydf()
p <-   ggplot(MyDF, aes(MyDF$WeekNr))
p <- p +  geom_line(aes(y=MyDF$Abverkauf))
p <- p +  geom_line(aes(y=200+50*MyDF$Werbung,color = 'red'))
MyDF %>% head
p

if(1 %in% c(1,2,3)){
  print("hi")
}
DF <- MyDF %>% MovingAverage(4)
DF %>% head()
ExpoSmo <- function(df) {
  y <- ses(df$Abverkauf,alpha = 0.3)
  df$FittedSES <- y$fitted
  return(df)
}

DF <- DF %>% ExpoSmo()
DF %>% head()
