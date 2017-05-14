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





