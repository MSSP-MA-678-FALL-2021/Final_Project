library(ggplot2)


# Plot the entire distribution in popularity and source of Anime
ggplot(df,aes(type, fill = type)) + geom_bar() + theme_bw() + 
  theme(panel.grid = element_blank(), 
        panel.border = element_blank(),
        axis.line = element_line(colour = "black"),
        plot.title = element_text(hjust = 0.5),
        legend.position = "none") +
  labs(title = "Type of Anime Between 2008 to 2020", x = "Type", y = "Number of Anime")

# total_plot <- ggplot(df,aes(source, log(popularity), fill = type)) + geom_bar(stat = "identity") + theme_bw() + 
#   theme(axis.text.x = element_text(angle = 90), 
#         panel.grid = element_blank(), 
#         panel.border = element_blank(),
#         axis.line = element_line(colour = "black"),
#         plot.title = element_text(hjust = 0.5)) +
#   labs(title = "Popularity and Sources Between 2008 to 2020", x = "Source", y = "Popularity") +
#   scale_fill_discrete(name = "Type")

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



################################################################################
################################################################################
# Appendix Plot
# Total Dataset
total <- getData(1)
ggplot(total, aes(year_sta, source, color = type)) + geom_point() + theme_bw() +
  theme(panel.grid = element_blank(), 
        panel.border = element_blank(),
        axis.line = element_line(colour = "black"),
        plot.title = element_text(hjust = 0.5)) +
  labs(title = "Anime Source", x = "Year", y = "Source")

####################################################################
# plot function: Type
type_anime <- function(df) {
  p <- ggplot({{df}}, aes(source, fill = source)) +
    geom_bar() + set_theme
  return(p)
}

music_plot <- type_anime(music) + labs(title = "Source in Music", y = "Frequency")
ona_plot <- type_anime(ona) + labs(title = "Source in ONA", y = "Frequency")
ova_plot <- type_anime(ova) + labs(title = "Source in OVA", y = "Frequency")
special_plot <- type_anime(special) + labs(title = "Source in Special", y = "Frequency")

grid.arrange(music_plot, ona_plot, special_plot, ova_plot, nrow = 2)

####################################################################
# Filter different rate level
rate1 <- df %>% filter(rating == "PG-13 - Teens 13 or older")
rate2 <- df %>% filter(rating == "PG - Children")
rate3 <- df %>% filter(rating == "G - All Ages")
rate4 <- df %>% filter(rating == "Rx - Hentai")
rate5 <- df %>% filter(rating == "R+ - Mild Nudity")
rate6 <- df %>% filter(rating == "R - 17+ (violence & profanity)")
rate7 <- df %>% filter(rating == "None")

# set up theme for rate level plot
set_theme_rate <- theme_bw() + 
  theme(panel.grid = element_blank(),
        panel.border = element_blank(),
        axis.line = element_line(colour = "black"),
        plot.title = element_text(hjust = 0.5),
        axis.text.x = element_text(angle = 90),
        legend.position = "none")


# plot function: Rating
rate_anime <- function(df) {
  p <- ggplot({{df}}, aes(type, fill = source)) +
    geom_bar() + set_theme_rate + labs(y = "Frequency", x = "Type")
  return(p)
}

r1 <- rate_anime(rate1) + labs(title = "PG-13 - Teens 13 or older")
r2 <- rate_anime(rate2) + labs(title = "PG - Children")
r3 <- rate_anime(rate3) + labs(title = "G_ All Age")
r4 <- rate_anime(rate4) + labs(title = "Rx - Hentai")
r5 <- rate_anime(rate5) + labs(title = "R+ - Mild Nudity")
r6 <- rate_anime(rate6) + labs(title = "R - 17+ (violence & profanity)")
r7 <- rate_anime(rate7) + labs(title = "None")

grid.arrange(r1,r2,r3,r4,r5,r6,r7, nrow = 3)


# mean value of source
mean <- df %>% group_by(source) %>% 
  summarise(mean = mean(score))
ggplot(mean) +geom_line(aes(source, sort(mean), group = 1)) + set_theme +
  labs(title = "Mean Value of Source", x = "Source", y = "Mean")

# random effect plot
# rdf1 <- ranef(lmer_model_1)$`rating:episodes`
# rdf2 <- ranef(lmer_model_2)$`rating:episodes`
# 
# rdf1$interaction<-rownames(rdf1)
# colnames(rdf1)<-c('random effect','interaction')
# rownames(rdf1)<-seq(1,dim(rdf1)[1])
# rdf1.1 <- rdf1 %>% separate(interaction, into = c("Rating", "Num"), sep = ":")
# rdfp1 <- ggplot(rdf1.1, aes(x = Rating,y = `random effect`, color = `Num`)) +
#   geom_point() +
#   geom_text(aes(label = round(`random effect`,2)),vjust = 1.5, hjust = 1.5,size=4,check_overlap = TRUE,show_guide  = F) +
#   guides(label = FALSE )+labs(title='Movie',x='Rating')
# 
# rdf2$interaction<-rownames(rdf2)
# colnames(rdf2)<-c('random effect','interaction')
# rownames(rdf2)<-seq(1,dim(rdf2)[1])
# rdf2.1 <- rdf2 %>% separate(interaction, into = c("Rating", "Num"), sep = ":")
# rdfp2 <- ggplot(rdf2.1, aes(x = Rating,y = `random effect`, color = `Num`)) +
#   geom_point() +
#   geom_text(aes(label = round(`random effect`,2)),vjust = 1.5, hjust = 1.5,size=4,check_overlap = TRUE,show_guide  = F) +
#   guides(label = FALSE )+labs(title='Movie',x='Rating')
