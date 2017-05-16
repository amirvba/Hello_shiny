# What about weekly data
# Use smaller names for directories!
# I have used WerbungMax and WerbungMin to check 
# if both have the same output!
# What precision is asked? Do I need to order each day or on a 
# weeklay basis?! 



#To Do List:

#6. Temporarily I will delete NA.


# Data Cleaning:
#  NAs
#  Outliers

# Moving Average
# Exponential smoothing
# Winter
# Holtwinter
# Regression
# ARIMA?!
# Show the distribution of Data in each week using box plot
# ma(elecsales, order=5) <- what is this?
# Can I use it to control my calculations?!

# Fragen an Tobias:
# Do I have to implement the rollmean by myself?
# Gibt es besondere Kriterien bei der Entscheidung übe Außreiser?!
# Ist es wichtig, dass eine Prognose für jeden Tag erzeuge? 
#Oder reicht es, wenn ich nur auf wöchentliche Basis prognotiziere?


?hw

?ses

apply(MyDF$Abverkauf,1,function(x) any(is.na(x)))
y <- c(1,2,NA)
sum(y)
y<-is.na(MyDF$PAM)
y[y==TRUE]


# Jome 5 shanbe
# Trend
# Winter
# Dade ghabli!
# 
