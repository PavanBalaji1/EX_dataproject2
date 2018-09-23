library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Plot1 - base plotting system

totalemissionsyear <- group_by(NEI, year) %>% summarise(total = sum(Emissions))
barplot(totalemissionsyear $total, names.arg = c("1999", "2002", "2005", "2008"), ylab = "Emissions PM2.5 (tons)", xlab = "Year", col = "red", main = "Total Emissions (PM 2.5) - All Sources")

png("Plot1.png")
dev.set(2)
dev.copy(png, "Plot1.png")
dev.off()