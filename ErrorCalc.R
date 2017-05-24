dfErros <- function(Abverkauf, Fitted) {
  df$Deviation <- Fitted - Abverkauf

  df %>% head() %>% print()

  #MSD: Mean squared deviation
  df$SD <- df$Deviation ^ 2
 
  #MAD: Mean absolute deviation
  df$AD <- abs(df$Deviation)
 
  #MAPE: Mean absolute percentage error
  df$APE <- abs(df$Deviation) / df$Abverkauf

  
  print(df %>% class())  
  return(df)
}


