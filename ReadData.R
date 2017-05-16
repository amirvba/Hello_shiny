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
MyDF$DayNr <- weekdays(as.Date(MyDF$Datum)) %>% as.factor()

#MyDF[MyDF$Abverkauf==NA,] %>% count()
# Original Plot
qplot(Datum, Abverkauf ,data = MyDF)

# Differentation between first and last week!
MyDF %>% head()
MyDF %>% tail()
MyDF %>% str()
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



qplot(MyDF$Datum, MyDF$Abverkauf)

ggplot(MyDF,aes(x=Datum,y=Abverkauf,color=MyDF$Abverkauf))+
geom_line()#  geom_point()


df <- Cleandf %>% get__Weeklydf()
df[df$Abverkauf==12,] %>% count()
hist(df$Abverkauf)

df <- Cleandf %>% get__AMdf() %>% get__Weeklydf()

df <- Cleandf %>% get__PMdf() %>% get__Dailydf()
#df$Abverkauf <- df$Abverkauf %>% log()

qplot(df$Datum,df$Abverkauf)+xlab("Datum") + 
  ylab("Abverkauf")+geom_line()


hist(df$Abverkauf)
qplot(Cleandf$WeekNr,Cleandf$Abverkauf)+xlab("Datum") + 
  ylab("Abverkauf")
tsclean(MyDF$Abverkauf)


Myts <- ts(df$Abverkauf,frequency = 31)
Myts
Myts %>% decompose()
Myts %>% stl()
Myts %>% adf.test()

