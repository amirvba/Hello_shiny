df <- Cleandf %>% get__AMdf() %>% get__Weeklydf()

shinyServer(
  
  function(input,output){
    
     myData <- reactive({MyDF %>%
         myCleaner(input$DataCleaning) %>% 
         myPAMfunction(input$PAM) %>% 
         myWerbungfunction(input$Promotion) %>% 
         myDayfunction(input$TimeUnit) 
     })

     output$table <- renderDataTable(myData())
     output$plot <- renderPlot({
       data <- myData()
       ggplot(data , aes_string(colnames(data)[1], colnames(data)[2]))+geom_point()
       })
     
     output$BoxPlot <- renderPlot({
       data <- myData()
       #ggplot(data , aes_string(colnames(data)[1],colnames(data)[2]))+geom_boxplot()
       qplot(factor(0),Abverkauf,data=data,geom='boxplot')+ xlab(" ")
       #boxplot(MyDF$Abverkauf,horizontal = TRUE)
       
     })
  }
)