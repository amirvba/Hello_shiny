df <- Cleandf %>% get__AMdf() %>% get__Weeklydf()

shinyServer(
  
  function(input,output){
    output$myhist <- renderPlot({qplot(df$WeekNr,df$Abverkauf)+geom_line()})
  }
)


qplot(df$WeekNr,df$Abverkauf, geom = "line")
qplot(df$WeekNr,df$Abverkauf, geom = c("point", "smooth"))
