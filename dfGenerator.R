get__Tag <- function(df) {
  Dailydf <-   df %>%
    group_by(DayNr) %>%
    summarise(
      Abverkauf = sum(Abverkauf)
      
    )
  return(Dailydf)
}

myARIMA <- function(df) {
  local_df <- auto.arima(df$Abverkauf)
  local_df %>% names()
  #local_df$fitted
  df$Fitted_Arima <- local_df$fitted
  return(df)
}

myHoltWinter <- function(df) {
  myTS <- ts(df$Abverkauf,frequency =7)
  local_df<- hw(y = myTS)
  df$Fitted_hw <- local_df$fitted
  return(df)
}

 
#haha <- myTsReg(MyDF)
#MyDF %>% head()
#haha %>% str()

myRegression <- function(df) {
  mylm <- lm(Abverkauf~ Datum + DayNr + WeekNr + Werbung, data = df)
  summary(mylm)
  mylm %>% names()
  df$Regression<- mylm$fitted.values
  #accuracy(mylm) %>% print()
  return(df)
}


myMA <- function(df,n ) {
?accuracy  
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


get__AMdf <- function(df) {
  return(df[df$PAM == "AM",])
}

#PMdf <- df[df$PAM == "PM",]
get__PMdf <- function(df) {
  return(df[df$PAM == "PM",])
}

#Werbungdf <- df[df$Werbung == 1,]
get__Werbungdf <- function(df) {
  return(df[df$Werbung == 1,])
}

#OhneWerbungdf <- df[df$Werbung == 0,]
get__OhneWerbungdf <- function(df) {
  return(df[df$Werbung == 0,])
}


get__Dailydf <- function(df) {
  Dailydf <-   df %>%
    group_by(Datum) %>%
    summarise(
      Abverkauf = sum(Abverkauf),
      Werbung = max(Werbung),
      #WerbungMin = min(Werbung),
      DayNr = max(DayNr),
      WeekNr = max(WeekNr),
      MonthNr = max(MonthNr)
    )
  return(Dailydf)
}

get__Weeklydf <- function(df) {
  Weeklydf <-   df %>%
    group_by(WeekNr) %>%
    summarise(
      Abverkauf = sum(Abverkauf),
      #Werbung = min(Werbung)
      Werbung = max(Werbung),
      MonthNr = max(MonthNr)
    )
  return(Weeklydf)
}

get__Monthlydf <- function(df) {
  Monthlydf <-   df %>%
    group_by(MonthNr) %>%
    summarise(
      Abverkauf = sum(Abverkauf),
      #WerbungMin = min(Werbung),
      Werbung = max(Werbung)
      )
  return(Monthlydf)
}

myTest <- function(df){
  print(df %>% head())
  print(df %>% tail())
}


myPAMfunction <- function(df, type) {
  df <- switch(type,
               Both =df,
               AM=get__AMdf(df),
               PM=get__PMdf(df))
  return(df)
}

myDayfunction <- function(df, type) {
  df <- switch(type,
               Original =df ,
               Daily = get__Dailydf(df),
               Weekly=get__Weeklydf(df))
               #Monthly = get__Monthlydf(df))
  return(df)
}

myWerbungfunction <- function(df, type) {
  df <- switch(type,
               Both =df,
               Within=get__Werbungdf(df),
               Without=get__OhneWerbungdf(df))
  return(df)
}

myDataChanger <- function(df,type1,type2,type3){
  return(df %>% 
    myPAMfunction(type1) %>% 
    myWerbungfunction(type2) %>% 
    myDayfunction(type3))
}


myCleaner <- function(df, type){
  df <- switch(type,
               None = df,
               Custome = df[df$Abverkauf<30,],
               ts_clean = df[df$Abverkauf<20,])
               #ts_clean = ts(df$Abverkauf,frequency = 30) %>% tsclean(replace.missing = TRUE))
  return(df)
}


