
advertising <- read.csv('../../data/Advertising.csv')


ad_reg <- lm(Sales ~ TV + Radio + Newspaper, data = advertising)

ad_reg_summ <- summary(ad_reg)

tv_reg <- lm(Sales ~ TV, data = advertising)
radio_reg <- lm(Sales ~ Radio, data = advertising)
newspaper_reg <- lm(Sales ~ Newspaper, data = advertising)

tv_reg_summary <- summary(tv_reg)
radio_reg_summary <- summary(radio_reg)
newspaper_reg_summary <- summary(newspaper_reg)

save(tv_reg_summary, radio_reg_summary, newspaper_reg_summary,
     file = '../../data/regression.RData')

png('../../images/residual-plot.png')
plot(ad_reg, which = 1)
dev.off()

png('../../images/normal-qq-plot.png')
plot(ad_reg, which = 2)
dev.off()

png('../../images/scale-location-plot.png')
plot(ad_reg, which = 3)
dev.off()
