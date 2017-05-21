source('~/Zeitreihe/ReadData.R')


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
               Weekly=get__Weeklydf(df),
               Monthly = get__Monthlydf(df))
  return(df)
  }
             
myWerbungfunction <- function(df, type) {
  df <- switch(type,
               Both =df,
               Within=get__Werbungdf(df),
               Without=get__OhneWerbungdf(df))
  return(df)
}

myDFchanger <- function(df,Type1,Type2){   #,Type3){
  df2 <- df %>% myPAMfunction(Type1) %>% 
        myWerbungfunction(Type2) #%>%   myDayfunction(df,Type3)
  return(df2)
}

df <- myDFchanger(MyDF,"PM","Within")#,"Weekly")
head(df)
df %>%
  myPAMfunction("PM") %>% myWerbungfunction("Within") %>% 
  myDayfunction("Daily") %>% head()

df2 <- renderDataTable(df %>% myPAMfunction(input$PAM)) 
