
get_AMdf <- function(df) {
  return(df[df$PAM == "AM",])
}


#PMdf <- df[df$PAM == "PM",]
get_PMdf <- function(df) {
  return(df[df$PAM == "PM",])
}


#Werbungdf <- df[df$Werbung == 1,]
get_Werbungdf <- function(df) {
  return(df[df$Werbung == 1,])
}

#OhneWerbungdf <- df[df$Werbung == 0,]
get_OhneWerbungdf <- function(df) {
  return(df[df$Werbung == 0,])
}

Dailydf <-   df %>%
  group_by(Datum) %>%
  summarise(
    Abverkauf = sum(Abverkauf),
    WerbungMax = max(Werbung),
    WerbungMin = min(Werbung),
    WeekNr = max(WeekNr)
  )

#get_Weeklydf <- function(df, WeekNr, Abverkauf, Werbung) {
get_Weeklydf <- function(df) {
  Weeklydf <-   df %>%
    group_by(WeekNr) %>%
    summarise(
      Abverkauf = sum(Abverkauf),
      WerbungMax = max(Werbung),
      WerbungMin = min(Werbung)
    )
  return(Weeklydf)
}

#Monthlydf <- function(df, MonthNr, Abverkauf, Werbung) {
get_Monthlydf <- function(df) {
  Monthlydf <-   df %>%
    group_by(MonthNr) %>%
    summarise(
      Abverkauf = sum(Abverkauf),
      WerbungMax = max(Werbung),
      WerbungMin = min(Werbung)
    )
  return(Monthlydf)
}

myTest <- function(df){
  print(df %>% head())
  print(df %>% tail())
}

myTest(MyDF)
####################################
#Almost Original code from Internet:
df %>% head()
lubridate::week(ymd("2014-03-16", "2014-03-17", "2014-03-18", '2014-01-01'))
df$Datum[1]

ubridate::week(ymd(df$Datum[100]))
week(ymd(df$Datum %>% tail()))

df$Datum %>% tail()
#amir = df$Datum %>% tail()
#lubridate::month(ymd(tail("2000-03-31")))