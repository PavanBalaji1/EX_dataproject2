library(dplyr)
library(ggplot2)
library(stringr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC$EI.Sector <- as.character(SCC$EI.Sector)
SCC$SCC <- as.character(SCC$SCC)

coal_df <- filter(SCC, str_detect(SCC$EI.Sector, "Coal"))

coal_df_vector <- coal_df$SCC

coalemission <- NEI %>% filter(SCC %in% coal_df_vector) %>% group_by(year) %>% summarise(total = sum(Emissions))
barplot(coalemission$total, names.arg = c("1999", "2002", "2005", "2008"), ylab = "Emissions PM2.5 (tons)", xlab = "Year", col = "blue", main = "USA Total Emissions (PM 2.5) Coal-Combustion Related Sources")

png("Plot4.png")
dev.set(2)
dev.copy(png, "Plot4.png")
dev.off()