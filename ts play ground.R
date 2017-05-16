source('C:/Users/amir/Desktop/Seminar, Zeitreihen/testRepository/MyLibraries.R')
source('C:/Users/amir/Desktop/Seminar, Zeitreihen/testRepository/dfGenerator.R')
cat("\014")
source('C:/Users/amir/Desktop/Seminar, Zeitreihen/testRepository/MyLibraries.R')

MyPath <-"C:\\Users\\amir\\Desktop\\Seminar, Zeitreihen\\Daten_amir.csv"

MyDF <-  read.csv(MyPath, header = TRUE, sep = c(";"," "))
MyDF <- MyDF[c(-6)]
MyDF$Datum <- as.Date(MyDF$Datum,format = "%d.%m.%Y")
MyDF$WeekNr <- week(ymd(MyDF$Datum))
MyDF$MonthNr <- month(ymd(MyDF$Datum))
MyDF$DayNr <- weekdays(as.Date(MyDF$Datum)) %>% as.factor()

count_ts <- ts(MyDF$Abverkauf)

qplot(MyDF$Datum,MyDF$Abverkauf)
qplot(MyDF$Datum,MyDF$Abverkauf)



MyDF$Abverkauf <- tsclean(count_ts)
daily_data <- MyDF %>% get__Weeklydf()
daily_data <- daily_data$Abverkauf
daily_data$cnt_ma = ma(daily_data$Abverkauf, order=7) # using the clean count with no outliers
daily_data$cnt_ma30 = ma(daily_data$Abverkauf, order=30)


ggplot() +
  geom_line(data = daily_data, aes(x = WeekNr, y = Abverkauf, colour = "Abverkauf")) +
  geom_line(data = daily_data, aes(x = WeekNr, y = cnt_ma,   colour = "Abverkauf2"))  +
  geom_line(data = daily_data, aes(x = WeekNr, y = cnt_ma30, colour = "Monthly Moving Average"))  +
  ylab('Bicycle Count')
  
daily_data <- ts(daily_data,frequency = 7)
daily_data %>% class
decomp = stl(daily_data,s.window = "periodic")
plot(decomp)


adf.test(daily_data, alternative = "stationary")
