# Model fitting
library(rstanarm)
library(lme4)

# df1 <- cleanData(1)
# df2 <- cleanData(2)


# model_1 <- lmer(log(popularity) ~ score + rating + type + (1 | popularity), data = df2)
# 
# model_2 <- lmer(score ~ source + rating + genres + (1 | popularity) + (1 + rank | rating), data = df2)