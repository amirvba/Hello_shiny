#library(shiny)

shinyUI(fluidPage(
  titlePanel(title = "Time Series analysis"),
  sidebarLayout(
    sidebarPanel("Data manipulation",
      #selectInput("var",Choices=c("am" = 1,"ir" = 2)),
      #br(),
      #sliderInput("bins", "Select the number of ", min = ,max = ,value = ),
      br(),
      radioButtons("PAM","AM or PM?",choices =  c("Both", "AM" ,"PM"),selected = "Both"),
      radioButtons("TimeUnit","Time unit?",choices =  c("Original","Daily" ,"Weekly","Monthly"),selected = "Original"),
      radioButtons("Promotion","Promotion?",choices =  c("Both","Within","Without"),selected = "Both"),
      radioButtons("DataCleaning", "Data Preprocessing",choices =  c("NoCleaning","CustomCleaing","tsClean"),selected = "NoCleaning")
      
    ),#fluidRow(dataTableOutput("table")
      
               mainPanel(
                 tabsetPanel(
                   id = 'dataset',
                   tabPanel("Plot", plotOutput("plot")),
                   tabPanel('data', dataTableOutput('table'))
                   
                   #tabPanel('diamondss', dataTableOutput('table')),
                   #tabPanel('iris', DT::dataTableOutput('mytable3'))
                   
    #mainPanel(textOutput("myPAM"),textOutput("myTimeUnit"),textOutput("myPromotion"))
    
  )
))))


# Daily, Weekly, Monthly
# AM, PM
# Werbung

# case statement in R!

# Moving Average
# Explonentieles Glätten
# ARIMA
# Regression