shinyServer(function(input,output){
  myPercent <- 0.9   
  myData <- reactive({MyDF %>% 
          #MyDF[1:(nrow(df) * myPercent),] %>% 
            myCleaner(input$DataCleaning) %>% 
#           myWerbungfunction(input$Promotion) %>% 
            myDayfunction(input$TimeUnit) %>%  
            myMA_n(c(2,4,7)) %>% 
            myHoltWinter() %>% 
            myARIMA() %>% 
            myReg(input$TimeUnit)
            
     })
     
  myTestData <- reactive({test_df <-  df[(nrow(df) * myPercent):nrow(df),] %>% 
      myCleaner(input$DataCleaning) %>% 
      #myWerbungfunction(input$Promotion) %>% 
      myDayfunction(input$TimeUnit) %>%  
      myMA_n(c(2,4,7)) %>% 
      myRegression() %>% 
      myHoltWinter() %>% 
      myARIMA()
  })
  
     myMAPE <- reactive({
       data2 <- myData()
       myList_Fitted <-  data.frame( "MAPE" =list(data2$Regression,
                                                  data2$FittedMA_7,
                                                  data2$Fitted_hw,
                                                  data2$Fitted_Arima) %>% 
                                       sapply(MAPE ,actual = df$Abverkauf))
       })
     
     output$table <- renderDataTable(myData())
     output$Erros <- renderDataTable(myMAPE())
     
     output$Werbungs_Effekt <- renderPlot({
       data <- myData()
          p <- ggplot(data, aes_string(colnames(data)[1]))
          p <- p +  geom_line(aes(y=Abverkauf))
          p <- p +  geom_line(aes(y=mean(Abverkauf)*Werbung,color = 'red'))
          p
     })
     
     output$BoxPlot1 <- renderPlot({
       data <- myData()
       p <- ggplot(data = data, aes(x = as.factor(DayNr), y = Abverkauf,fill=DayNr)) 
       p <- p + geom_boxplot()
       p <- p + scale_x_discrete(name = "Werktag") 
       p <- p + labs(fill = "Werktag")
       p
       
     })
     
     output$BoxPlot2 <- renderPlot({
       data <- myData()
       ggplot(data = data, aes(x = as.factor(Werbung), y = Abverkauf,fill=as.factor(Werbung))) +
         geom_boxplot()+ scale_x_discrete(name = "Werbung")+labs(fill = "Werbung")
       
       
     })
     
      output$Reg_Forcast <- renderPlot({
       df <- myData()
       p <- ggplot(df, aes_string(colnames(df)[1]))
       p <- p +  geom_line(aes(y = Abverkauf))
       if("myRegression" %in% input$myMethod) { 
         p <- p +  geom_line(aes(y = Regression), color = 'red')}
       
       if("myARIMA" %in% input$myMethod) { 
         p <- p +  geom_line(aes(y = Fitted_Arima), color = 'blue')}
       
       if("myHW" %in% input$myMethod) { 
         p <- p +  geom_line(aes(y = Fitted_hw), color = 'yellow')}
 
       if("myMA" %in% input$myMethod) { 
         p <- p +  geom_line(aes(y = FittedMA_7), color = 'green')}
       
       p
})})