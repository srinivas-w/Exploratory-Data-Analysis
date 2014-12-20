library(ggplot2)
library(plyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI_24510 <- NEI[which(NEI$fips == "24510"), ]
aggregate_24510 <- with(NEI_24510, aggregate(Emissions, by = list(year), sum))
colnames(aggregate_24510) <- c("year", "Emissions")

NEI_24510_type <- ddply(NEI_24510, .(type, year), summarize, Emissions = sum(Emissions))
NEI_24510_type$Pollutant_Type <- NEI_24510_type$type

qplot(year, Emissions, data = NEI_24510_type, group = Pollutant_Type, color = Pollutant_Type, 
    geom = c("point", "line"), ylab = expression("Total Emissions, PM"[2.5]), 
    xlab = "Year", main = "Total Emissions in U.S. by Type of Pollutant")