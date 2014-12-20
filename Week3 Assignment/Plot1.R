library(plyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

aggregate_data <- with(NEI, aggregate(Emissions, by = list(year), sum))

png(filename='plot1.png')

plot(aggregate_data, type = "o", ylab = expression("Total Emissions, PM"[2.5]), 
    xlab = "Year", main = "Total Emissions in the United States")
polygon(aggregate_data, col = "red", border = "blue")

dev.off()
