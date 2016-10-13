
library(readr)
library(xtable)
advertising <- read.csv('../../data/Advertising.csv')


##########
# Summary Statistics
##########


tv_stats <- summary(advertising$TV)
radio_stats <- summary(advertising$Radio)
newspaper_stats <- summary(advertising$Newspaper)
sales_stats <- summary(advertising$Sales)

tv_reg <- lm(Sales ~ TV, data = advertising)
radio_reg <- lm(Sales ~ Radio, data = advertising)
newspaper_reg <- lm(Sales ~ Newspaper, data = advertising)

tv_coefficients <- summary(tv_reg)$coefficients
radio_coefficients <- summary(radio_reg)$coefficients
newspaper_coefficients <- summary(newspaper_reg)$coefficients

save(tv_coefficients, radio_coefficients, newspaper_coefficients,
     file = '../../data/correlation-matrix.RData')


output_file <- '../../data/eda-output.txt'

cat('Summary Statistics of Advertising.csv\n\n', file = output_file)
sink(file = output_file, append = T)
cat('Summary Statistics of TV Budget\n')
tv_stats
cat('\nSummary Statistics of Radio Budget\n')
radio_stats
cat('\nSummary Statistics of Newspaper Budget\n')
newspaper_stats
cat('\nSummary Statistics of Sales\n')
sales_stats
cat('\n\nSimple Regressions of Sales\n\n')
cat('Simple Regression of Sales on TV\n\n')
tv_coefficients
cat('\nSimple Regression of Sales on Radio\n\n')
radio_coefficients
cat('\nSimple Regression of Sales on Newspaper\n\n')
newspaper_coefficients
sink()


##########
# Plots
##########


png('../../images/scatterplot-matrix.png')
plot(advertising[,2:5], main = 'Scatterplot Matrix of Advertising Data')
dev.off()

png('../../images/histogram-tv.png')
hist(advertising$TV, main = "Histogram of TV Budget", 
     xlab = "TV Budget (in thousands of dollars)")
dev.off()

png('../../images/histogram-radio.png')
hist(advertising$Radio, main = "Histogram of Radio Budget", 
     xlab = "Radio Budget (in thousands of dollars)")
dev.off()

png('../../images/histogram-newspaper.png')
hist(advertising$Newspaper, main = "Histogram of Newspaper Budget", 
     xlab = "Newspaper Budget (in thousands of dollars)")
dev.off()

png('../../images/histogram-sales.png')
hist(advertising$Sales, main = "Histogram of Sales", 
     xlab = "Sales (in thousands of units)")
dev.off()



