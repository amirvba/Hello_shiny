source('~/Zeitreihe/ReadData.R')
source('~/Zeitreihe/dfGenerator.R')


df <- MyDF
df <- ts(df$Abverkauf,frequency = 30)
mylm <- tslm(Abverkauf~ Datum+ DayNr + WeekNr +Werbung ,data = df)
summary(mylm)
mylm %>% names()
df$Regression<- mylm$fitted.values

p <- ggplot(df, aes_string(colnames(df)[1])) 
p <- p +  geom_line(aes(y=Abverkauf)) 
p <- p +  geom_line(aes(y=Regression),color='red')
#p <- p +  geom_line(aes(y=FittedMA_20),color='blue') 
p

install.packages("pryr")


f <- function(x="amir"){
  
  print(x)
}
f("amir")

f("Arezu")

df <- MyDF %>% get__Dailydf()
df %>% head()

myReg <- function(df, myTimeUnit="Daily") {

  LocalL_TimeUnit<- switch(myTimeUnit, 
          Original=df$Datum,
          Daily = df$Datum,
          Weekly= df$WeekNr,
         "There is something wrong!!"
  )
  
  
  mylm <- lm(Abverkauf~ LocalL_TimeUnit + DayNr + WeekNr + Werbung, data = df)
  summary(mylm)
  mylm %>% names()
  df$Regression<- mylm$fitted.values
  #accuracy(mylm) %>% print()
  return(df)
}

myReg(df, "Daily")
myReg(df, "Weekly")


#myRegression(,input$TimeUnit)
df %>% myRegression( df$WeekNr)


AA = 'Daily'
AA ='Original'
switch(AA, 
       Original=df$Datum,
       Weekly=df$WeekNr,
       default
)


c("Original", "Daily" , "Weekly")

MyDF %>% str()
MyDF %>% head()
