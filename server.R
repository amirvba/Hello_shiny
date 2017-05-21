df <- Cleandf %>% get__AMdf() %>% get__Weeklydf()

shinyServer(
  
  function(input,output){
    
     output$myPAM <- renderText(input$PAM)
     output$myTimeUnit <- renderText(input$TimeUnit)
     output$myPromotion <- renderText(input$Promotion)
     #output$myage <- renderText(input$age)
    #output$JAvab <- renderText(input$PAM)
    #output$myhist <- renderPlot({qplot(df$WeekNr,df$Abverkauf)+geom_line()})
  }2
)


#qplot(df$WeekNr,df$Abverkauf, geom = "line")
#qplot(df$WeekNr,df$Abverkauf, geom = c("point", "smooth"))
x <-function(list){print("amiru")}

