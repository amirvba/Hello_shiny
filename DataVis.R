df1 <- MyDF %>% 
  group_by(Datum) %>% 
  summarise(Abverkauf = sum(Abverkauf),Werbung = sum(Werbung))

df1 %>%  head()
qplot(df1$Datum,df1$Abverkauf)+geom_line() +ylim(c(0,250))

p1 <- ggplot(MyDF, aes(x=MyDF$Datum, y=MyDF$Abverkauf, color='red'))+geom_line()
p2 <- ggplot(MyDF, aes(x=MyDF$Datum, y=MyDF$Werbung))+geom_line()

qplot(Ami$Datum,Ami$Abverkauf)#+geom_line()

qplot(MyDF$Datum,MyDF$Abverkauf)+geom_line() #+xlim(c("1999-06-01","1999-7-29"))
MyDF$Datum %>% tail()

ggplot(MyDF, aes(x=MyDF$Datum))+ 
  geom_line(aes(y=MyDF$Abverkauf))+
  geom_line(aes(y=10*MyDF$Werbung,color = 'red',size="2"))

qplot(MyDF$Datum,MyDF$Abverkauf) +ylim(c(0,10))

MyDF %>% head(20)

df1 %>% head(20)
sum(MyDF$Abverkauf[1:19])
df1 %>% tail()

hist(MyDF$Abverkauf)
#aggregate(Datum~Abverkauf,df,sum())%>% head(

qplot(AMdf$RecNum,AMdf$Abverkauf)+geom_line()
var(AMdf$Abverkauf)

qplot(PMdf$RecNum,PMdf$Abverkauf)+geom_line()
var(PMdf$Abverkauf)

qplot(Weeklydf$WeekNr,Weeklydf$Abverkauf)+geom_line()


ggplot(Weeklydf, aes(Weeklydf$WeekNr))+ 
  geom_line(aes(y=Weeklydf$Abverkauf))+
  geom_line(aes(y=200+50*Weeklydf$WerbungMax,color = 'red'))


myplot = function(df, x_string, y_string) {
  ggplot(df, aes_string(x = x_string, y = y_string)) + geom_line()
}
var(df$Abverkauf)
var(MyDF$Abverkauf)
