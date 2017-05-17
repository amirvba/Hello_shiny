library(shiny)

shinyUI(fluidPage(
  titlePanel(title = "Where is it?"),
  sidebarLayout(
    sidebarPanel(
      #selectInput("var",Choices=c("am" = 1,"ir" = 2)),
      #br(),
      #sliderInput("bins", "Select the number of ", min = ,max = ,value = ),
      #br(),
      #radioButtons("color","select the",Choices=c("am" ,"ir"),selected = "am")
      
    ),
    mainPanel(plotOutput("myhist"))
  )
))

# Daily, Weekly, Monthly
# AM, PM
# Werbung

# Moving Average
# Explonentieles Glätten
# ARIMA
# Regression