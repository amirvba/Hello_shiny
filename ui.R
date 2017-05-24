shinyUI(fluidPage(
  titlePanel(title = "Time Series analysis"),
  sidebarLayout(
    sidebarPanel(strong("Data manipulation:"),width = 3,
      br(),
      # radioButtons("PAM","AM or PM?",
      #              choices =  c("Both", "AM" , "PM"),
      #              selected = "Both"),
      radioButtons("TimeUnit","Time unit?",
                   choices =  c("Original", "Daily" , "Weekly"),
                   selected = "Original"),
      radioButtons("Promotion","Promotion?",
                   choices =  c("Both", "Within", "Without"),
                   selected = "Both"),
      radioButtons("DataCleaning","Data Preprocessing",
                   choices =  c("None", "Custome", "ts_clean"),
                   selected = "None"),
      checkboxGroupInput("myMethod", "Forcast methods:",
                         c("Moving Average" = "myMA",
                           "Exponetial Smoothing" = ",myExpoSmo",
                           "ARIMA" = "myARIMA",
                           "Regression" = "myRegression"),selected = "myExpoSmo")),
    
  
    mainPanel(tabsetPanel(
      id = 'dataset',
      
      tabPanel("LayerdForcast", plotOutput("LayerdForcast")),
      tabPanel('Data', dataTableOutput('table')),
      tabPanel("Plot", plotOutput("plot")),
      tabPanel("LayerdPlot", plotOutput("LayerdPlot")),
      
      tabPanel("Histogram", plotOutput("BoxPlot"))
      
    )))))

# Moving Average
# Explonentieles Glätten
# ARIMA
# Regression