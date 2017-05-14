df <- MyDF %>% get__PMdf() %>% get__Dailydf()
myplot(df,names(df)[1],"Abverkauf")

df <- MyDF %>% get__AMdf() %>% get__Weeklydf()
myplot(df,names(df)[1],"Abverkauf")
df %>% head()

Mylm  <-lm(df$Abverkauf~df$WeekNr+df$WerbungMax)

plot(Mylm)  
plot(predict(Mylm,df = df$WeekNr))

mylm <- tslm(formula = Abverkauf~ WeekNr , data = ts(df,frequency = 4))
plot(mylm)



df <- MyDF %>% get__PMdf() %>% get__Dailydf()

mylm <- lm(df$Abverkauf~df$Datum+df$WerbungMax)
df$Fitted <- mylm$fitted.values
summary(mylm)

n <- 4
FittedMA <- c(rep(NA,n)  ,head(rollmean(df$Abverkauf, n),-1))
df$FittedMA <- FittedMA
df %>% head()

qplot(df$Datum, df$Fitted)
qplot(df$Datum, df$Abverkauf)#+geom_line()#,type="l")

ggplot(df, aes(df$Datum))+ 
  geom_line(aes(y=df$Abverkauf))+
  geom_line(aes(y=df$FittedMA,color = 'red'))


ggplot(df, aes(df$WeekNr))+ 
  geom_line(aes(y=df$Abverkauf))+
  geom_line(aes(y=df$FittedMA,color = 'red'))
