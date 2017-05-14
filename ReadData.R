source('C:/Users/amir/Desktop/Seminar, Zeitreihen/testRepository/MyLibraries.R')
#cat("\014")
source('C:/Users/amir/Desktop/Seminar, Zeitreihen/testRepository/MyLibraries.R')
rm(list = ls())
MyPath <-"C:\\Users\\amir\\Desktop\\Seminar, Zeitreihen\\Daten_amir.csv"

MyDF <-  read.csv(MyPath, header = TRUE, sep = c(";"," "))
MyDF <- MyDF[c(-6)]
MyDF$Datum <- as.Date(MyDF$Datum,format = "%d.%m.%Y")
MyDF$WeekNr <- week(ymd(MyDF$Datum))
MyDF$MonthNr <- month(ymd(MyDF$Datum))

print(MyDF %>% str())
print(MyDF %>% head())

qplot(Datum, Abverkauf ,data = MyDF)#+geom_line()
#ggplot(MyDF,aes(Datum,Abverkauf))+geom_line()

#writeLines("Tail:")
#print(MyDF %>% tail())