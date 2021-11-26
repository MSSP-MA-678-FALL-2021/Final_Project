# Model fitting
library(rstanarm)
library(lme4, arm)

# Linear model
model_1 <- stan_glm(log(popularity) ~ duration + rating + score + source + rank, data = movie, refresh = 0)
model_2 <- stan_glm(log(popularity) ~ duration + rating + score + source + rank, data = tv, refresh = 0)
pred_1 <- posterior_predict(model_1, draws = 1000)
pred_2 <- posterior_predict(model_2, draws = 1000)
par(mfrow=c(1,2))
binnedplot(fitted(model_1), resid(model_1), main = "Movie")
binnedplot(fitted(model_2), resid(model_2), main = "TV")


# Multilevel model
lmer_model_1 <- lmer(log(popularity) ~ rating + score + rank + (1 | duration:genres), data = movie)
lmerp_1a <- plot(lmer_model_1,main ='Residuals vs Fitted')
lmerp_2a <- qqmath(lmer_model_1,main='QQ Plot')
grid.arrange(lmerp_1a, lmerp_2a, nrow = 1)

lmer_model_2 <- lmer(log(popularity) ~ rating + score + rank + (1 | duration:genres), data = tv)
lmerp_1b <- plot(lmer_model_2, main = 'Residuals vs Fitted')
lmerp_2b <- qqmath(lmer_model_2,main='QQ Plot')
grid.arrange(lmerp_1b, lmerp_2b, nrow = 1)