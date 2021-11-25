library(ggplot2)


# Plot the entire distribution in popularity and source of Anime
total_plot <- ggplot(df,aes(source, log(popularity), fill = type)) + geom_bar(stat = "identity") + theme_bw() + 
  theme(axis.text.x = element_text(angle = 90), 
        panel.grid = element_blank(), 
        panel.border = element_blank(),
        axis.line = element_line(colour = "black"),
        plot.title = element_text(hjust = 0.5)) +
  labs(title = "Popularity and Sources Between 2008 to 2020", x = "Source", y = "Popularity") +
  scale_fill_discrete(name = "Type")


# Plot by difference subsets
movie_plot <- ggplot(movie, aes(source, fill = source)) +
  geom_bar() + set_theme + 
  labs(title = "Source of Anime in Movie", y = "Frequency")

music_plot <- ggplot(music, aes(source, fill = source)) +
  geom_bar() + set_theme + 
  labs(title = "Source of Anime in Music", y = "Frequency")

ona_plot <- ggplot(ona, aes(source, fill = source)) +
  geom_bar() + set_theme + 
  labs(title = "Source of Anime in ONA", y = "Frequency")

ova_plot <- ggplot(ova, aes(source, fill = source)) +
  geom_bar() + set_theme + 
  labs(title = "Source of Anime in OVA", y = "Frequency")

special_plot <- ggplot(special, aes(source, fill = source)) +
  geom_bar() + set_theme + 
  labs(title = "Source of Anime in Special", y = "Frequency")

tv_plot <- ggplot(tv, aes(source, fill = source)) +
  geom_bar() + set_theme + 
  labs(title = "Source of Anime in TV", y = "Frequency")

# set the layout for these plots
