

advertising <- read.csv('../../data/Advertising.csv')


##########
# Summary Statistics
##########


tv_stats <- summary(advertising$TV)
radio_stats <- summary(advertising$Radio)
newspaper_stats <- summary(advertising$Newspaper)
sales_stats <- summary(advertising$Sales)

correlation <- cor(advertising[,2:5])

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
cat('\nCorrelation Matrix of Advertising\n')
correlation
sink()



save(correlation, file = '../../data/correlation-matrix.RData')


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



