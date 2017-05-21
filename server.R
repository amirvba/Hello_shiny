df <- Cleandf %>% get__AMdf() %>% get__Weeklydf()

shinyServer(
  
  function(input,output){
    df <- MyDF 
    
     output$myPAM <- renderText(input$PAM)
     output$myTimeUnit <- renderText(input$TimeUnit)
     output$myPromotion <- renderText(input$Promotion)

     #df2 <-myDFchanger(MyDF,"PM","Within")
     #df2 <-myDFchanger(MyDF,input$PAM,input$Promotion)
     
     #df<- myPAMfunction(df,'PM');
     #output$table <- renderDataTable(df %>% myPAMfunction(input$PAM))
     
     df2 <- renderDataTable(df %>% myPAMfunction(input$PAM)) #%>% 
       #myWerbungfunction(input$Promotion) %>% 
       #myDayfunction(input$TimeUnit) 
     output$table <-renderDataTable( df %>%
                                       myPAMfunction(input$PAM) %>% 
                                       myWerbungfunction(input$Promotion) %>% 
                                      myDayfunction(input$TimeUnit) 

     )
     output$plot <- renderPlot({qplot(MyDF$Datum,MyDF$Abverkauf)+geom_line()})
     
#     output$plot <- renderPlot({ggplot(myDFchanger(MyDF,input$PAM,input$Promotion),
#                                       aes(WeekNr,Abverkauf))})
     
     
  }
)


#qplot(df$WeekNr,df$Abverkauf, geom = "line")
#qplot(df$WeekNr,df$Abverkauf, geom = c("point", "smooth"))
