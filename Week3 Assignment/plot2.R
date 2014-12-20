library(plyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI_24510 <- NEI[which(NEI$fips == "24510"), ]
aggregate_24510 <- with(NEI.24510, aggregate(Emissions, by = list(year), sum))
colnames(aggregate_24510) <- c("year", "Emissions")

png(filename = "plot2.png")

plot(aggregate_24510, type = "o", ylab = expression("Total Emissions, PM"[2.5]), 
    xlab = "Year", main = "Total Emissions for Baltimore County", xlim = c(1999,2008))

dev.off()
