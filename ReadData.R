cat("\014")
source('C:/Users/amir/Desktop/Seminar, Zeitreihen/testRepository/MyLibraries.R')
rm(list = ls())

MyPath <-"C:\\Users\\amir\\Desktop\\Seminar, Zeitreihen\\Daten_amir.csv"

MyDF <-  read.csv(MyPath, header = TRUE, sep = c(";"," "))
MyDF <- MyDF[c(-6)]
MyDF$Datum <- as.Date(MyDF$Datum,format = "%d.%m.%Y")
MyDF$WeekNr <- week(ymd(MyDF$Datum))
MyDF$MonthNr <- month(ymd(MyDF$Datum))


print(MyDF %>% str())
writeLines("head:")
print(MyDF %>% head())
writeLines("Tail:")
print(MyDF %>% tail())


AMdf <- MyDF[MyDF$PAM == "AM",]
PMdf <- MyDF[MyDF$PAM == "PM",]

Dailydf <-   MyDF %>% 
  group_by(Datum) %>% 
  summarise(Abverkauf = sum(Abverkauf),WerbungMax = max(Werbung),WerbungMin = min(Werbung),WeekNr=max(WeekNr))
head(Dailydf,20)


Weeklydf <-   MyDF %>% 
  group_by(WeekNr) %>% 
  summarise(Abverkauf = sum(Abverkauf),WerbungMax = max(Werbung),WerbungMin = min(Werbung))
head(Weeklydf,20)
Weeklydf %>% data.frame()
MyDF %>% head()
MyDF %>% tail()


Monthlydf <-   MyDF %>% 
  group_by(MonthNr) %>% 
  summarise(Abverkauf = sum(Abverkauf),WerbungMax = max(Werbung),WerbungMin = min(Werbung))
head(Weeklydf,20)
MyDF %>% head()
MyDF %>% tail()

MyDF %>% head()
lubridate::week(ymd("2014-03-16", "2014-03-17","2014-03-18", '2014-01-01'))
MyDF$Datum[1]



lubridate::week(ymd(MyDF$Datum[100]))
week(ymd(MyDF$Datum %>% tail()))

MyDF$Datum %>% tail()
amir = MyDF$Datum %>% tail()
lubridate::month(ymd(tail( "2000-03-31")))
