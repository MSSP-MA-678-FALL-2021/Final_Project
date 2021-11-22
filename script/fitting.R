# Model fitting
library(rstanarm)
library(lme4)

model_1 <- lmer(log(popularity) ~ score + rating + type + (1 | popularity), data = df)

model_2 <- lmer(score ~ source + rating + genres + (1 | popularity) + ( 1 + rank | rating), data = df)