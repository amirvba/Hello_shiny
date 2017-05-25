shinyServer(
  function(input,output){
    
     myData <- reactive({MyDF %>% 
#         head(1000) %>% 
         myCleaner(input$DataCleaning) %>% 
#         myPAMfunction(input$PAM) %>% 
         myWerbungfunction(input$Promotion) %>% 
         myDayfunction(input$TimeUnit) %>%  
         myMA_n(c(2,4,7)) %>% 
         myRegression()
       
     })
     
     output$table <- renderDataTable(myData())
     output$plot <- renderPlot({
       data <- myData()
       ggplot(data , aes_string(colnames(data)[1], colnames(data)[2]))+geom_line()
       })
     
     output$BoxPlot <- renderPlot({
       data <- myData()
       qplot(factor(0),Abverkauf,data=data,geom='boxplot')+ xlab(" ")
       
     })
     
     output$LayerdPlot <- renderPlot({
       data <- myData()
          p <- ggplot(data, aes_string(colnames(data)[1]))
          p <- p +  geom_line(aes(y=Abverkauf))
          p <- p +  geom_line(aes(y=mean(Abverkauf)*Werbung,color = 'red'))
          p
       
     })
     
     output$MA_Forcast <- renderPlot({
       
       data <- myData()
       p <- ggplot(data, aes_string(colnames(data)[1])) 
       p <- p +  geom_line(aes(y=Abverkauf))
       #if(input$myMethod=="myMA") {print("hi")}
       p <- p +  geom_line(aes(y=FittedMA_2),color='red')
       p <- p +  geom_line(aes(y=FittedMA_7),color='blue') 
       
      p
        
     })
     
     output$Reg_Forcast <- renderPlot({
       data <- myData()
       
       p <- ggplot(data, aes_string(colnames(data)[1])) 
       p <- p +  geom_line(aes(y=Abverkauf))
       #if(input$myMethod=="myMA") {print("hi")}
       p <- p +  geom_line(aes(y=Regression),color='red')
       #p <- p +  geom_line(aes(y=FittedMA_7),color='blue') 
       
       p
       
     })
     
  }
)