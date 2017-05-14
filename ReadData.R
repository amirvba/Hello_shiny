rm(list = ls())
source('C:/Users/amir/Desktop/Seminar, Zeitreihen/testRepository/MyLibraries.R')
source('C:/Users/amir/Desktop/Seminar, Zeitreihen/testRepository/dfGenerator.R')
cat("\014")
source('C:/Users/amir/Desktop/Seminar, Zeitreihen/testRepository/MyLibraries.R')

MyPath <-"C:\\Users\\amir\\Desktop\\Seminar, Zeitreihen\\Daten_amir.csv"

MyDF <-  read.csv(MyPath, header = TRUE, sep = c(";"," "))
MyDF <- MyDF[c(-6)]
MyDF$Datum <- as.Date(MyDF$Datum,format = "%d.%m.%Y")
MyDF$WeekNr <- week(ymd(MyDF$Datum))
MyDF$MonthNr <- month(ymd(MyDF$Datum))

#MyDF[MyDF$Abverkauf==NA,] %>% count()
# Original Plot
qplot(Datum, Abverkauf ,data = MyDF)#+geom_line()


df <- MyDF %>% get__Weeklydf()

# Differentation between first and last week!
MyDF %>% head()
MyDF %>% tail()
MyDF[MyDF$WeekNr==22,] %>% count()

MyDF$WeekNr[MyDF$Datum=="1999-06-01"] = 0
MyDF$WeekNr[MyDF$Datum=="1999-06-02"] = 0
MyDF$WeekNr[MyDF$Datum=="1999-06-03"] = 0

MyDF %>% head()
MyDF %>% tail()
MyDF[MyDF$WeekNr==22,] %>% count()
##########


# Outlier removal
boxplot(MyDF$Abverkauf,horizontal = TRUE)
(MyOutlier <- subset(MyDF,Abverkauf>30))
Cleandf <- MyDF[MyDF$Abverkauf<30,]
boxplot(Cleandf$Abverkauf,horizontal = TRUE)
hist(Cleandf$Abverkauf)
hist(MyDF$Abverkauf)



#dff <- MyDF %>% get__Weeklydf()

ggplot(df, aes(df$WeekNr))+ 
  geom_line(aes(y=df$Abverkauf))+
  geom_line(aes(y=dff$Abverkauf,color = 'red'))


ggplot(MyDF, aes(MyDF$Abverkauf))+ geom_boxplot()#+ylim(c(0,100))