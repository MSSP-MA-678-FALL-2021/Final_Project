library(stringr)
library(dplyr)

# Function to clean the data 
getData <- function(cod) {
  animate_data <- read_csv("data/anime_data.csv")
  df1 <- animate_data %>% relocate(title,.before = aired_from)
  df1 <- df1[,c(2,3,5,7,8,10,11,12,13,14,19)] %>% 
    rename(year_sta = aired_from)
  df2 <- df1 %>% filter(year_sta >= "2008-01-01")
  df2$genres <- str_replace(df2$genres, "\\[", "")
  df2$genres <- str_replace(df2$genres, "\\]", "")
  df2$genres <- str_replace(df2$genres, "\\,", "")
  df2$genres <- str_trim(df2$genres)
  df2$year_sta <- as.Date(df2$year_sta, format = "1984-01-01")
  if(cod == 1) {
    return(df1)
  } else {return(df2)}
}

# More detail in cleaning
df <- getData(2)
df$year_sta <- str_replace_all(df$year_sta, "\\-", "\\/")
df$year_sta <- as.Date(df$year_sta)
movie <- df %>% filter(type == "Movie")
tv <- df %>% filter(type == "TV")
music <- df %>% filter(type == "Music")
ona <- df %>% filter(type == "ONA")
ova <- df %>% filter(type == "OVA")
special <- df %>% filter(type == "Special")
