library(tidyverse)
library(plotly)

#  Tidy data
animate_data <- read_csv("data/anime_data.csv")


data_1 <- animate_data %>% relocate(title,.before = aired_from) %>% 
  select(-c(title_english, mal_id, premiered, synopsis, studios)) %>% 
  rename(year_sta = aired_from) %>% rename(year_end = aired_to)



plot_ly(data = data_1, x = ~title, y = ~year_sta, color = ~type, type = "scatter") # need more information to define the data. 

