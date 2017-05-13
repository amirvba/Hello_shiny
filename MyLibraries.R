rm(list = ls())

library(smooth)
library(ggplot2)
library(forecast)
library(magrittr)
library(zoo)
library(dplyr)

#library(hflights)
#library(reshape)
#library(gridExtra)
#library(tseries)


#install.packages("")


#####################

cat("\014")
rm(list = ls())

source('~/Desktop/Seminar, ZeitReihen/MyLibrary.R')


#MyPath <- file.choose()
MyPath <-"/home/amir/Desktop/Daten_Meshkati.csv"
#MyDF <-  read.csv(MyPath, header = TRUE, sep = c(";"," "))
MyDF <-  read.csv(MyPath, header = FALSE,skip = 2, sep = c(";"," "))

names(MyDF)<-c("Datum","Uhrzeit","AM","Werbung","Aberverkauf")
MyDF$Datum <- as.Date(MyDF$Datum,format = "%d.%m.%Y")

#MyDF$Uhrzeit <- as.Date(MyDF$Uhrzeit,format = "%h.%m.%s")

#MyDF$time <- strptime(MyDF$Uhrzeit,"%H:%M:%S")
MyDF %>% str()

#MyDF <- MyDF[c(-1,-2)]
MyDF %>% head()
MyDF %>% tail()



df1 <- MyDF %>% 
  group_by(Datum) %>% 
  summarise(Abverkauf = sum(Abverkauf),Werbung = sum(Werbung))

df1 %>%  head()
qplot(df1$Datum,df1$Abverkauf)+geom_line() +ylim(c(0,250))

p1 <- ggplot(MyDF, aes(x=MyDF$Datum, y=MyDF$Abverkauf, color='red'))+geom_line()
p2 <- ggplot(MyDF, aes(x=MyDF$Datum, y=MyDF$Werbung))+geom_line()


Ami <- MyDF[1:20,]
Ami$neu <- "AM" %in% Ami$Uhrzeit


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
#aggregate(Datum~Abverkauf,df,sum())%>% head()

