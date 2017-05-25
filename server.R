shinyServer(
  function(input,output){
    
     myData <- reactive({MyDF %>% 
             myCleaner(input$DataCleaning) %>% 
             myWerbungfunction(input$Promotion) %>% 
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
     output$plot <- renderPlot({
       data <- myData()
       ggplot(data , aes_string(colnames(data)[1], colnames(data)[2]))+geom_line()
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
     output$BoxPlot <- renderPlot({
       data <- myData()
       qplot(factor(0),Abverkauf,data=data,geom='boxplot')+ xlab(" ")
       
     })
     
     output$Reg_Forcast <- renderPlot({
       df <- myData()
      
      # print(class(input$myMethod))
       print(input$myMethod)
      
       
       p <- ggplot(df, aes_string(colnames(df)[1]))
       p <- p +  geom_line(aes(y = Abverkauf))
       
       
       if("myRegression" %in% input$myMethod) { 
         p <- p +  geom_line(aes(y = Regression), color = 'red')  
       }
       if("myARIMA" %in% input$myMethod) { 
         p <- p +  geom_line(aes(y = Fitted_Arima), color = 'blue')  
       }
       
       if("myHW" %in% input$myMethod) { 
         p <- p +  geom_line(aes(y = Fitted_hw), color = 'yellow')
       }
       if("myMA" %in% input$myMethod) { 
         p <- p +  geom_line(aes(y = FittedMA_7), color = 'green')
       }
       
       p
       
     })
  }
)