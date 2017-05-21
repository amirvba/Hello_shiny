#ggplot(MyDF, aes(x=MyDF$Datum))+ 
#  geom_line(aes_string(x = x_string)+
#  geom_line(aes(aes_string(x = x_string,color = 'red',size="2")))


get__AMdf <- function(df) {
  return(df[df$PAM == "AM",])
}

#PMdf <- df[df$PAM == "PM",]
get__PMdf <- function(df) {
  return(df[df$PAM == "PM",])
}



#Werbungdf <- df[df$Werbung == 1,]
get__Werbungdf <- function(df) {
  return(df[df$Werbung == 1,])
}

#OhneWerbungdf <- df[df$Werbung == 0,]
get__OhneWerbungdf <- function(df) {
  return(df[df$Werbung == 0,])
}

#Dailydf <- function(df, Datum, Abverkauf, Werbung, WeekNr) {

get__Dailydf <- function(df) {
  Dailydf <-   df %>%
    group_by(Datum) %>%
    summarise(
      Abverkauf = sum(Abverkauf),
      Werbung = max(Werbung),
      #WerbungMin = min(Werbung),
      WeekNr = max(WeekNr),
      DayNr = max(DayNr)
    )
  return(Dailydf)
}
#MyDF %>% get__Dailydf() %>% head()
#get_Weeklydf <- function(df, WeekNr, Abverkauf, Werbung) {
get__Weeklydf <- function(df) {
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
get__Monthlydf <- function(df) {
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


#Almost Original code from Internet:
week(ymd("2014-03-16", "2014-03-17","2014-03-18", '2014-01-01'))