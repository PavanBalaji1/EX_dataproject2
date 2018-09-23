library(dplyr)


NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

motoremiss<- NEI %>% filter(type == "ON-ROAD") %>% group_by(year) %>% summarise(total = sum(Emissions))
barplot(motoremiss$total, names.arg = c("1999", "2002", "2005", "2008"), xlab = "Year", ylab = "Emissions PM2.5 (tons)", main = "Total Motor Vehicle Related Emissions (PM2.5) - Baltimore City", col = "purple")

png("Plot5.png")
dev.set(2)
dev.copy(png, "Plot5.png")
dev.off()
