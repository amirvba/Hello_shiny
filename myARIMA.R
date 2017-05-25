source('~/Zeitreihe/ReadData.R')
source('~/Zeitreihe/dfGenerator.R')

#df <-MyDF %>% get__Dailydf()
df <-MyDF %>%
  get__Dailydf() %>% 
  #get__Weeklydf() %>% 
  myMA_n(c(2,4,7)) %>% 
  myRegression()
myARIMA <- auto.arima(df$Abverkauf)
myARIMA %>% names()
myARIMA$fitted
df$Fitted_Arima <- myARIMA$fitted
data <- df
# p <- ggplot(data, aes_string(colnames(data)[1])) 
# p <- p +  geom_line(aes(y=Abverkauf))
# p <- p +  geom_line(aes(y=Fitted_Arima),color='blue')
# p <- p +  geom_line(aes(y=Regression),color='red')
# 
# p

myTS <- ts(df$Abverkauf,frequency =7)

myHW<- hw(y = myTS)#,alpha = 0.1,beta = 0.2,gamma = 0.3,phi = TRUE)
myHW %>% names()

myHW$fitted %>% head()

df$Fitted_hw <- myHW$fitted
df$Fitted_hw %>% str()
df$Fitted_hw %>% head()
df$Fitted_hw %>% tail()

MAPE(actual = df$Abverkauf,forecast = df$Regression)
MAPE(actual = df$Abverkauf,forecast = df$Fitted_Arima)
MAPE(actual = df$Abverkauf,forecast = df$FittedMA_7)
MAPE(actual = df$Abverkauf,forecast = df$Fitted_hw)
