shinyUI(fluidPage(
  titlePanel(title = "Time Series analysis"),
  sidebarLayout(
    sidebarPanel(strong("Data manipulation:"),width = 3,
      br(),
      radioButtons("PAM","AM or PM?",
                   choices =  c("Both", "AM" , "PM"),
                   selected = "Both"),
      radioButtons("TimeUnit","Time unit?",
                   choices =  c("Original", "Daily" , "Weekly", "Monthly"),
                   selected = "Original"),
      radioButtons("Promotion","Promotion?",
                   choices =  c("Both", "Within", "Without"),
                   selected = "Both"),
      radioButtons("DataCleaning","Data Preprocessing",
                   choices =  c("None", "Custome", "ts_clean"),
                   selected = "None"),
      checkboxGroupInput("myMethod", "Forcast methods:",
                         c("Moving Average" = ",myMA",
                           "Exponetial Smoothing" = ",myExpoSmo",
                           "ARIMA" = "myARIMA",
                           "Regression" = "myRegression"))),
    
      #radioButtons("Forcasts","Forcasting Methods",
      #           choices =  c("Moving Average", "ExponentielesGlaetten", "Regression"),
      #           selected = "NoCleaning")),
  
    mainPanel(tabsetPanel(
      id = 'dataset',
      #tabPanel("LayerdForcast", plotOutput("LayerdForcast")),
      tabPanel("Plot", plotOutput("plot")),
      tabPanel("LayerdPlot", plotOutput("LayerdPlot")),
      tabPanel('Data', dataTableOutput('table')),
      tabPanel("Histogram", plotOutput("BoxPlot"))
      
    )))))

# Moving Average
# Explonentieles Glätten
# ARIMA
# Regression