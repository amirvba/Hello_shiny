source('~/Zeitreihe/ReadData.R')
source('~/Zeitreihe/dfGenerator.R')


df <- MyDF
df <- ts(df$Abverkauf,frequency = 30)
mylm <- tslm(Abverkauf~ Datum+ DayNr + WeekNr +Werbung ,data = df)
summary(mylm)
mylm %>% names()
df$Regression<- mylm$fitted.values

p <- ggplot(df, aes_string(colnames(df)[1])) 
p <- p +  geom_line(aes(y=Abverkauf)) 
p <- p +  geom_line(aes(y=Regression),color='red')
#p <- p +  geom_line(aes(y=FittedMA_20),color='blue') 
p
