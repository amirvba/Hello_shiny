qplot(AMdf$RecNum,AMdf$Abverkauf)+geom_line()
var(AMdf$Abverkauf)

qplot(PMdf$RecNum,PMdf$Abverkauf)+geom_line()
var(PMdf$Abverkauf)

qplot(Weeklydf$WeekNr,Weeklydf$Abverkauf)+geom_line()


ggplot(Weeklydf, aes(Weeklydf$WeekNr))+ 
  geom_line(aes(y=Weeklydf$Abverkauf))+
  geom_line(aes(y=200+50*Weeklydf$WerbungMax,color = 'red'))

df <- MyDF %>% get__PMdf() %>% get__Weeklydf()
myplot(df,names(df)[1],"Abverkauf")

df <- MyDF %>% get__AMdf() %>% get__Weeklydf()
myplot(df,names(df)[1],"Abverkauf")

myplot = function(df, x_string, y_string) {
  ggplot(df, aes_string(x = x_string, y = y_string)) + geom_line()
}
var(df$Abverkauf)
var(MyDF$Abverkauf)

Mylm  <-lm(df$Abverkauf~df$WeekNr+df$WerbungMax)
summary(Mylm)
plot(Mylm)  
plot(predict(Mylm,df = df$WeekNr))

qplot(df[1],df$Datum)
head(MyDF[2])
names(MyDF)[1]


DayDF <- get_Dailydf(MyDF)
DayDF %>% dim()
