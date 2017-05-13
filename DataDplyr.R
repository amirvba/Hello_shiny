qplot(AMdf$RecNum,AMdf$Abverkauf)+geom_line()
var(AMdf$Abverkauf)

qplot(PMdf$RecNum,PMdf$Abverkauf)+geom_line()
var(PMdf$Abverkauf)

qplot(Weeklydf$WeekNr,Weeklydf$Abverkauf)+geom_line()


ggplot(Weeklydf, aes(Weeklydf$WeekNr))+ 
  geom_line(aes(y=Weeklydf$Abverkauf))+
  geom_line(aes(y=200+50*Weeklydf$WerbungMax,color = 'red'))
