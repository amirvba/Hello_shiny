cat("\014")
rm(list = ls())

source('C:/Users/amir/Desktop/Seminar, Zeitreihen/testRepository/MyLibraries.R')

#MyPath <- file.choose()
MyPath <-"C:\\Users\\amir\\Desktop\\Seminar, Zeitreihen\\Daten_amir.csv"

MyDF <-  read.csv(MyPath, header = TRUE, sep = c(";"," "))
MyDF <- MyDF[c(-6)]
MyDF$Datum <- as.Date(MyDF$Datum,format = "%d.%m.%Y")

MyDF %>% str()
MyDF %>% head()
MyDF %>% tail()
