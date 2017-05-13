qplot(AMdf$RecNum,AMdf$Abverkauf)+geom_line()
var(AMdf$Abverkauf)

qplot(PMdf$RecNum,PMdf$Abverkauf)+geom_line()
var(PMdf$Abverkauf)

qplot(Weeklydf$WeekNr,Weeklydf$Abverkauf)+geom_line()


ggplot(Weeklydf, aes(Weeklydf$WeekNr))+ 
  geom_line(aes(y=Weeklydf$Abverkauf))+
  geom_line(aes(y=200+50*Weeklydf$WerbungMax,color = 'red'))

df <- MyDF
ggplot(df, aes(df[1]))+ 
  geom_line(aes(y=df[2]))#+
  geom_line(aes(y=200+50*df[3],color = 'red'))


qplot(df[1],df$Datum)
head(MyDF[2])
