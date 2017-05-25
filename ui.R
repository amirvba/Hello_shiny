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
                   selected = "Daily"),
      radioButtons("Promotion","Promotion?",
                   choices =  c("Both", "Within", "Without"),
                   selected = "Both"),
      radioButtons("DataCleaning","Data Preprocessing",
                   choices =  c("None", "Custome", "ts_clean"),
                   selected = "None"),
      checkboxGroupInput("myMethod", "Forcast methods:",
                         c("Moving Average" = "myMA",
                           #"Exponetial Smoothing" = "myExpoSmo",
                           "ARIMA" = "myARIMA",
                           "Holt Winter" = "myHW",
                           "Regression" = "myRegression"))),#,selected = "myMA"
    
    mainPanel(tabsetPanel(
      id = 'dataset',
      
      tabPanel("Reg_Forcast", plotOutput("Reg_Forcast")),
      tabPanel('Erros', dataTableOutput('Erros')),
      tabPanel("LayerdPlot", plotOutput("LayerdPlot")),
      tabPanel("MA_Forcast", plotOutput("MA_Forcast")),
      tabPanel('Data', dataTableOutput('table')),
      
      tabPanel("Plot", plotOutput("plot")),
      tabPanel("Histogram", plotOutput("BoxPlot"))
      
)))))