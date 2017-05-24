source('~/Zeitreihe/ReadData.R', echo=TRUE)

df <- MyDF %>% get__Weeklydf()
df <- myMA_n(df,seq(2,20)) 

df %>% str()

p <- ggplot(df, aes_string(colnames(df)[1])) 
p <- p +  geom_line(aes(y=Abverkauf)) 
p <- p +  geom_line(aes(y=FittedMA_2),color='red')
p <- p +  geom_line(aes(y=FittedMA_20),color='blue') 
p
#  geom_line(aes(y=Abverkauf),color = 'red') #+
#geom_line(aes(y=mean(Abverkauf)*Werbung,color = 'red'))
