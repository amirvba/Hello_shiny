shinyUI(fluidPage(
  titlePanel(title = "Time Series analysis"),
  sidebarLayout(
    sidebarPanel(strong("Data manipulation:"),width = 3,
      br(),
      radioButtons("TimeUnit","Time unit?",
                   choices =  c("Original", "Daily" , "Weekly"),
                   selected = "Daily"),
      radioButtons("DataCleaning","Data Preprocessing",
                   choices =  c("None", "Custome", "ts_clean"),
                   selected = "None"),
      checkboxGroupInput("myMethod", "Forcast methods:",
                         c("Moving Average" = "myMA",
                           #"Exponetial Smoothing" = "myExpoSmo",
                           "ARIMA" = "myARIMA",
                           "Holt Winter" = "myHW",
                           "Regression" = "myRegression"))),
    
    mainPanel(tabsetPanel(id = 'dataset',
                          
      tabPanel("Reg_Forcast", plotOutput("Reg_Forcast")),
      tabPanel('Data', dataTableOutput('table')),
      tabPanel('Erros', dataTableOutput('Erros')),
      tabPanel("Werbungseffekt", plotOutput("Werbungs_Effekt")),
      tabPanel("Werbung BoxPlot", plotOutput("BoxPlot2")),
      tabPanel("Werktag BoxPlot", plotOutput("BoxPlot1"))

)))))

# radioButtons("PAM","AM or PM?",choices =  c("Both", "AM" , "PM"),selected = "Both"),
# radioButtons("Promotion","Promotion?",choices =  c("Both", "Within", "Without"),
# selected = "Both"),
