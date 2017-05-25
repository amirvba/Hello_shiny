rm(list = ls())
source('~/Zeitreihe/MyLibraries.R')
source('~/Zeitreihe/dfGenerator.R')
cat("\014")
source('~/Zeitreihe/MyLibraries.R')

MyPath <- "/home/amir/Desktop/Daten_amir.csv"

MyDF <-  read.csv(MyPath, header = TRUE, sep = c(";", " "))
MyDF <- MyDF[c(-1, -2)]
MyDF %>% head()
MyDF <- MyDF[, c(1, 4, 3, 2)]
MyDF$Datum <- as.Date(MyDF$Datum, format = "%m/%d/%Y")
MyDF %>% head()

MyDF$PAM <- MyDF$Uhrzeit %>% str_sub(start = -2)
MyDF$DayNr <- weekdays(as.Date(MyDF$Datum))
MyDF$WeekNr <- week(ymd(MyDF$Datum))
MyDF$MonthNr <- month(ymd(MyDF$Datum))

MyDF %>% head()
MyDF %>% str()
MyDF %>% tail()

# NA Detection
# MyDF[MyDF$Abverkauf==NA,] %>% count()
sapply(MyDF, function(x)  sum(is.na(x)))

#Outlier Detection:
summary(MyDF$Abverkauf)
#df <- MyDF %>% get__Dailydf()
#summary(df$Abverkauf)

MyDF[MyDF$Abverkauf == 96, ] %>% count()
# Differentation between first and last week!
MyDF[MyDF$WeekNr == 22, ] %>% count()

MyDF$WeekNr[MyDF$Datum == "1999-06-01"] = 0
MyDF$WeekNr[MyDF$Datum == "1999-06-02"] = 0
MyDF$WeekNr[MyDF$Datum == "1999-06-03"] = 0

MyDF %>% head()
MyDF %>% tail()
MyDF[MyDF$WeekNr == 22, ] %>% count()
##########

# Outlier removal






###############################
#Verfahren:

#df <-MyDF %>%
#  get__Dailydf() %>% 
  #get__Weeklydf() %>% 
#  myMA_n(c(2,4,7)) %>% 
#  myRegression()

#MyDF %>% str()
df <- MyDF %>% get__Dailydf()
#df <- MyDF %>% get__Weeklydf()


#Regression:
mylm <- lm(Abverkauf ~ Datum + DayNr + WeekNr + Werbung , data = df)
summary(mylm)
mylm %>% names()
df$Regression <- mylm$fitted.values


# Holt-Winter:
myTS <- ts(df$Abverkauf,frequency =7)
myHW<- hw(y = myTS)
df$Fitted_hw <- myHW$fitted


#Moving Average:
df <- myMA_n(df,c(2,4,7))



df %>%  head()
df %>% str()

myARIMA <- auto.arima(df$Abverkauf)
myARIMA %>% names()
myARIMA$fitted
df$Fitted_Arima <- myARIMA$fitted
data <- df

MAPE(actual = df$Abverkauf,forecast = df$Regression)
MAPE(actual = df$Abverkauf,forecast = df$Fitted_Arima)
MAPE(actual = df$Abverkauf,forecast = df$FittedMA_7)
MAPE(actual = df$Abverkauf,forecast = df$Fitted_hw)

p <- ggplot(df, aes_string(colnames(df)[1]))
p <- p +  geom_line(aes(y = Abverkauf))
p <- p +  geom_line(aes(y = Regression), color = 'red')
p <- p +  geom_line(aes(y = Fitted_Arima), color = 'blue')
p