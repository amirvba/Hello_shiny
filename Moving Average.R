n <- 3
#FittedMA <- c(rep(NA,n-1)  ,rollmean(df$Abverkauf, n))
FittedMA <- c(rep(NA,n)  ,head(rollmean(df$Abverkauf, n),-1))
FittedMA %>% head()
FittedMA %>% length()
df %>% dim()
df$FittedMA <- FittedMA
