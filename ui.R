library(shiny)

shinyUI(fluidPage(
  titlePanel(title = "Where is it?"),
  sidebarLayout(
    sidebarPanel(
      #selectInput("var",Choices=c("am" = 1,"ir" = 2)),
      #br(),
      #sliderInput("bins", "Select the number of ", min = ,max = ,value = ),
      br(),
      radioButtons("PAM","AM or PM?",choices =  c("Both", "AM" ,"PM"),selected = "Both"),
      radioButtons("TimeUnit","Time unit?",choices =  c("Original","Daily" ,"Weekly","Monthly"),selected = "Original"),
      radioButtons("Promotion","Promotion?",choices =  c("Both","Within","Without"),selected = "Both")
      
    ),
    mainPanel(textOutput("myPAM"),textOutput("myTimeUnit"),textOutput("myPromotion"))
    
  )
))

                  
# Daily, Weekly, Monthly
# AM, PM
# Werbung

# case statement in R!

# Moving Average
# Explonentieles Glätten
# ARIMA
# Regression