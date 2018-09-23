library(dplyr)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")



decbaltiyear<- NEI %>% filter(fips == 24510) %>% group_by(year, type) %>% summarise(total = sum(Emissions))

decbaltiyear$year <- as.factor(decbaltiyear$year) # enables appropriate x-axis labelling.

ggplot(decbaltiyear, aes(x = year, y = total)) + geom_bar(stat = "identity", fill = "blue") + facet_grid(.~type) + ggtitle("Baltimore Emissions (PM2.5)") + labs(x = "Year", y = "Total Emissions (PM2.5) tons") + ggtitle("Emissions (PM2.5) Baltimore City per Type") + theme(plot.title = element_text(hjust=0.5))

png("plot3.png")
dev.set(2)
dev.copy(png, "decbaltiyear.png")
dev.off()