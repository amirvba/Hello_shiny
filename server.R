df <- Cleandf %>% get__AMdf() %>% get__Weeklydf()

shinyServer(
  
  function(input,output){
    
     myData <- reactive({MyDF %>%
         myPAMfunction(input$PAM) %>% 
         myWerbungfunction(input$Promotion) %>% 
         myDayfunction(input$TimeUnit) 
     })

     output$table <- renderDataTable(myData())
     output$plot <- renderPlot({
       data <- myData()
       ggplot(data , aes_string(colnames(data)[1], colnames(data)[2]))+geom_point()
       })
  }
)