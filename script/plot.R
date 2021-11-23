library(plotly)

EDA_p <- function(cod){
  source("script/data clean.R")
  if (cod == 1) {
    plt1 <- plot_ly(data = df1, x = ~year_sta, y = ~source, color = ~type, type = "scatter")
    return(plt1)
  }
  if (cod == 2) {
    plt2 <- plot_ly(data = df2, x = ~year_sta, y = ~source, color = ~type, type = "scatter") 
    return(plt2)
  }
}

# Demo 
# EDA_p(1)
# EDA_p(2)
