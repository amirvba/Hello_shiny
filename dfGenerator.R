AMdf <- MyDF[MyDF$PAM == "AM",]
PMdf <- MyDF[MyDF$PAM == "PM",]

Werbungdf <- MyDF[MyDF$Werbung == 1,]
OhneWerbungdf <- MyDF[MyDF$Werbung == 0,]




Dailydf <-   MyDF %>%
  group_by(Datum) %>%
  summarise(
    Abverkauf = sum(Abverkauf),
    WerbungMax = max(Werbung),
    WerbungMin = min(Werbung),
    WeekNr = max(WeekNr)
  )
head(Dailydf, 20)


Weeklydf <-   MyDF %>%
  group_by(WeekNr) %>%
  summarise(
    Abverkauf = sum(Abverkauf),
    WerbungMax = max(Werbung),
    WerbungMin = min(Werbung)
  )
head(Weeklydf, 20)
Weeklydf %>% data.frame()
MyDF %>% head()
MyDF %>% tail()


Monthlydf <-   MyDF %>%
  group_by(MonthNr) %>%
  summarise(
    Abverkauf = sum(Abverkauf),
    WerbungMax = max(Werbung),
    WerbungMin = min(Werbung)
  )
head(Weeklydf, 20)
MyDF %>% head()
MyDF %>% tail()


####################################
#Almost Original code from Internet:
MyDF %>% head()
lubridate::week(ymd("2014-03-16", "2014-03-17", "2014-03-18", '2014-01-01'))
MyDF$Datum[1]

ubridate::week(ymd(MyDF$Datum[100]))
week(ymd(MyDF$Datum %>% tail()))

MyDF$Datum %>% tail()
#amir = MyDF$Datum %>% tail()
#lubridate::month(ymd(tail("2000-03-31")))