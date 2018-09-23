library(dplyr)
library(ggplot2)
library(stringr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


emissionlA<- NEI %>% filter(fips %in% c("24510", "06037"), type == "ON-ROAD") %>% group_by(year, fips) %>% summarise(total = sum(Emissions))

Location <- str_replace_all(emissionlA$fips, c("06037" = "LA County", "24510" = "Baltimore City")) 

emissionlA$year <- as.factor(emissionlA$year) # facilitates approriate x-axis labelling

ggplot(emissionlA, aes(x = year, y = total)) + geom_bar(stat = "identity", position = "dodge", aes(fill = Location)) + labs(x = "Year", y = "Total Emissions (PM2.5) tons") + ggtitle("On Road Emissions (PM2.5) Baltimore City & LA County") + theme(plot.title = element_text(hjust=0.5))

png("plot6.png")
dev.set(2)
dev.copy(png, "emissionlA.png")
dev.off()