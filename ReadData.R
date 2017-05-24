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
##qplot(Datum, Abverkauf ,data = MyDF)
MyDF$Datum <- as.Date(MyDF$Datum,format = "%m/%d/%Y")
MyDF %>% head()


##qplot(Datum, Abverkauf ,data = MyDF)
##qplot(Abverkauf ,data = MyDF)



MyDF$PAM <- MyDF$Uhrzeit %>% str_sub( start= -2)
MyDF$DayNr <- weekdays(as.Date(MyDF$Datum)) 
MyDF$WeekNr <- week(ymd(MyDF$Datum))
MyDF$MonthNr <- month(ymd(MyDF$Datum))


MyDF %>% head()
MyDF %>% str()
MyDF %>% tail()


#MyDF[MyDF$Abverkauf==NA,] %>% count()
# Original Plot


# Differentation between first and last week!

# I should write it using lapply. 
# refere to http://adv-r.had.co.nz/Functional-programming.html#fp-motivation

MyDF[MyDF$WeekNr==22,] %>% count()

MyDF$WeekNr[MyDF$Datum=="1999-06-01"] = 0
MyDF$WeekNr[MyDF$Datum=="1999-06-02"] = 0
MyDF$WeekNr[MyDF$Datum=="1999-06-03"] = 0

MyDF %>% head()
MyDF %>% tail()
MyDF[MyDF$WeekNr==22,] %>% count()
##########

# Outlier removal
#boxplot(MyDF$Abverkauf,horizontal = TRUE)
(MyOutlier <- subset(MyDF,Abverkauf>30))
Cleandf <- MyDF[MyDF$Abverkauf<30,]
#boxplot(Cleandf$Abverkauf,horizontal = TRUE)
#hist(Cleandf$Abverkauf)
#hist(MyDF$Abverkauf)


# Add Moving Average Fitted data:

