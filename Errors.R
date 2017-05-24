source('~/Zeitreihe/ReadData.R')
source('~/Zeitreihe/dfGenerator.R')

dff <- MyDF %>% 
  myMA_n(c(2,4)) %>% myRegression()

dff %>% str()

MAPE(dff$Abverkauf,dff$Regression)
MAPE(dff$Abverkauf,dff$FittedMA_2)
MAPE(actual = ,forecast = )

results <- list(dff$Regression, dff$FittedMA_2)

results %>% str()
results %>% class()

MyDF[,c(1:4)]%>% head()
sapply(results,MAPE,actual = dff$Abverkauf)


apply(results,2,MAPE,actual = dff$Abverkauf)


m <- dff[,-c(1:8)]
m <- dff[,c(2,11)]
lapply(m,colMeans)

m %>% head()
