# Only Moving Average, Stand alone!
source('~/Zeitreihe/ReadData.R')
source('~/Zeitreihe/dfGenerator.R')

cat("\014")
df <- MyDF %>% get__Dailydf()
df %>% head()
df %>% tail()


myMA <- function(df,n ) {
  
  FittedMA <- c(rep(NA,n)  ,head(rollmean(df$Abverkauf, n),-1))
  #FittedMA <- c(rep(NA,n)  ,head(rollmean(df()[,2], n),-1))
  FittedMA %>% head()
  FittedMA %>% length()
  df %>% dim()
  df$FittedMA <- FittedMA
  length(names(df))
  #df %>% head()
  
  names(df)[length(names(df))] <-paste("FittedMA" ,toString(n),sep = "_")
  return(df)
}

myMA_n <- function(DF,myRange) {
  df <- DF
  
  for(i in myRange){
    df_tempp <- myMA(df,i)
    df <- data.frame(df, df_tempp[,ncol(df_tempp),drop=FALSE])
  }
  return(df)
}
myMA_n(MyDF,seq(2,7)) %>% head(10)
