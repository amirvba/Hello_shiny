rm(list = ls())
source('~/Zeitreihe/MyLibraries.R')
source('~/Zeitreihe/dfGenerator.R')
cat("\014")
source('~/Zeitreihe/MyLibraries.R')

MyPath <- "/home/amir/Desktop/Daten_amir.csv"

MyDF <-  read.csv(MyPath, header = TRUE, sep = c(";"," "))
MyDF <- MyDF[c(-1,-2)]
MyDF %>% head()
MyDF <- MyDF[,c(1,4,3,2)]
MyDF$Datum <- as.Date(MyDF$Datum,format = "%m/%d/%Y")
MyDF %>% head()

MyDF$PAM <- MyDF$Uhrzeit %>% str_sub( start= -2)
MyDF$DayNr <- weekdays(as.Date(MyDF$Datum)) 
MyDF$WeekNr <- week(ymd(MyDF$Datum))
MyDF$MonthNr <- month(ymd(MyDF$Datum))


MyDF %>% head()
MyDF %>% str()
MyDF %>% tail()


# NA Detection
#MyDF[MyDF$Abverkauf==NA,] %>% count()
sapply(MyDF, function(x) sum(is.na(x)))


#Outlier Detection:
summary(MyDF$Abverkauf)
#df <- MyDF %>% get__Dailydf()
#summary(df$Abverkauf)

MyDF[MyDF$Abverkauf==96,] %>% count()
# Differentation between first and last week!
MyDF[MyDF$WeekNr==22,] %>% count()

MyDF$WeekNr[MyDF$Datum=="1999-06-01"] = 0
MyDF$WeekNr[MyDF$Datum=="1999-06-02"] = 0
MyDF$WeekNr[MyDF$Datum=="1999-06-03"] = 0

MyDF %>% head()
MyDF %>% tail()
MyDF[MyDF$WeekNr==22,] %>% count()
##########

# Outlier removal


# Add Moving Average Fitted data:

#MyDF$DayNr <- MyDF$DayNr %>% as.factor()
#MyDF %>% str()
df <- MyDF %>% get__Dailydf()
#df <- MyDF %>% get__Weeklydf()


mylm <- lm(Abverkauf~ Datum+ DayNr + WeekNr +Werbung ,data = df)
summary(mylm)
mylm %>% names()
df$Regression<- mylm$fitted.values

p <- ggplot(df, aes_string(colnames(df)[1])) 
p <- p +  geom_line(aes(y=Abverkauf)) 
p <- p +  geom_line(aes(y=Regression),color='red')
#p <- p +  geom_line(aes(y=FittedMA_20),color='blue') 
p



MyDF %>% str()
