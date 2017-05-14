n <- 7
df <- Cleandf %>% get__PMdf() %>% get__Weeklydf()
df <- Cleandf %>%  get__Dailydf()

mylm <- lm(df$Abverkauf~ df$WeekNr+df$WerbungMax)
df$FittedReg <- mylm$fitted.values
summary(mylm)



FittedMA <- c(rep(NA,n)  ,head(rollmean(df$Abverkauf, n),-1))
df$FittedMA <- FittedMA
df %>% head()

#qplot(df$WeekNr, df$FittedMA)+geom_line()
qplot(df$WeekNr, df$Abverkauf)+geom_line()#,type="l")

ggplot(df, aes(df$Datum))+ 
  geom_line(aes(y=df$Abverkauf))+
  geom_line(aes(y=df$FittedMA,color = 'red'))


ggplot(df, aes(df$WeekNr))+ 
  geom_line(aes(y=df$Abverkauf))+
  geom_line(aes(y=df$FittedMA, color = 'red'))+
  geom_line(aes(y=df$FittedReg, color = 'blue'))

ggplot(df, aes(df$Datum))+ 
  geom_line(aes(y=df$Abverkauf))+
  geom_line(aes(y=df$FittedSES,color = 'red'))

