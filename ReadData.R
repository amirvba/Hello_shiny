source('C:/Users/amir/Desktop/Seminar, Zeitreihen/testRepository/MyLibraries.R')
#cat("\014")
source('C:/Users/amir/Desktop/Seminar, Zeitreihen/testRepository/MyLibraries.R')
#rm(list = ls())
MyPath <-"C:\\Users\\amir\\Desktop\\Seminar, Zeitreihen\\Daten_amir.csv"

MyDF <-  read.csv(MyPath, header = TRUE, sep = c(";"," "))
MyDF <- MyDF[c(-6)]
MyDF$Datum <- as.Date(MyDF$Datum,format = "%d.%m.%Y")
MyDF$WeekNr <- week(ymd(MyDF$Datum))
MyDF$MonthNr <- month(ymd(MyDF$Datum))

print(MyDF %>% str())
print(MyDF %>% head())
par(mfrow=c(1,1))
qplot(Datum, Abverkauf ,data = MyDF)#+geom_line()
#ggplot(MyDF,aes(Datum,Abverkauf))+geom_line()

#writeLines("Tail:")
#print(MyDF %>% tail())

MyDF[MyDF$WeekNr==20,] %>% count()
MyDF[MyDF$WeekNr==22,] %>% count()

df <- MyDF %>% get__Weeklydf()
df <- Cleandf
ggplot(df, aes(df$Datum))+ 
  geom_line(aes(y=df$Abverkauf))

boxplot(MyDF$Abverkauf,horizontal = TRUE)

boxplot.stats(MyDF$Abverkauf)
(MyOutlier <- subset(MyDF,Abverkauf>30))
Cleandf <- MyDF[MyDF$Abverkauf<30,]

y_string <- c("1999-06-01","1999-06-02","1999-06-03")
MyDF$WeekNr[MyDF$Datum=="1999-06-01"] = 0
MyDF$WeekNr[MyDF$Datum=="1999-06-02"] = 0
MyDF$WeekNr[MyDF$Datum=="1999-06-03"] = 0

MyDF[MyDF$WeekNr==20,] %>% count()
MyDF[MyDF$WeekNr==22,] %>% count()

#dff <- MyDF %>% get__Weeklydf()

ggplot(df, aes(df$WeekNr))+ 
  geom_line(aes(y=df$Abverkauf))+
  geom_line(aes(y=dff$Abverkauf,color = 'red'))


#MyDF$WeekNr[MyDF$Datum %in% y_string] = 0

head(MyDF,50)
tail((MyDF))


ggplot(MyDF, aes(MyDF$Abverkauf))+ geom_boxplot()#+ylim(c(0,100))
