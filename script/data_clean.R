library(tidyverse)

# data clean

cleanData <- function(df) {
  animate_data <- read_csv("data/anime_data.csv")
  
  df1 <- animate_data %>% relocate(title,.before = aired_from) %>% 
    select(-c(title_english, mal_id, premiered, synopsis, studios)) %>% 
    rename(year_sta = aired_from) %>% rename(year_end = aired_to)
  
  if(df == {{df1}}) {
    df1 <- df1 %>% mutate(log_poplrt = log(popularity)) %>%
      mutate(log_scored_by = log(scored_by))
    return(df1)
  }
  
  if(df == {{df2}}) {
    df2 <- df1 %>% filter(year_sta >= "2008-01-01")
  }
}



