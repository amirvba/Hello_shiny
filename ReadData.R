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
myFeatures <- MyDF
MyDF <- MyDF %>% 
#    get__Dailydf() %>% 
    myMA_n(c(2,4,7)) %>% 
    myRegression() %>% 
    myHoltWinter() %>% 
    myARIMA()

df <-MyDF 

df %>%  head()
df %>% str()

p <- ggplot(df, aes_string(colnames(df)[1]))
p <- p +  geom_line(aes(y = Abverkauf))
p <- p +  geom_line(aes(y = Regression), color = 'red')
#p <- p +  geom_line(aes(y = Fitted_Arima), color = 'blue')
#p <- p +  geom_line(aes(y = Fitted_hw), color = 'yellow')
#p <- p +  geom_line(aes(y = Fitted_hw), color = 'green')
p


myList_Fitted <- list(df$Regression,df$FittedMA_7,df$Fitted_hw,df$Fitted_Arima)

myData <- MyDF
myList_Fitted <- list(myData$Regression,
                      myData$FittedMA_7,
                      myData$Fitted_hw,
                      myData$Fitted_Arima) %>% 
  sapply(MAPE ,actual = df$Abverkauf) %>% data.frame()
names(myList_Fitted)  <- "MAPE"
