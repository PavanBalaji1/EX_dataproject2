library(dplyr)
library(ggplot2)
library(stringr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC.sub <- SCC[grepl("Coal" , SCC$Short.Name), ]
NEI.sub <- NEI[NEI$SCC %in% SCC.sub$SCC, ]

png("Plot4.png",width=400,height=400,units="px",bg="transparent")

ggp <- ggplot(NEI.sub, aes(x = factor(year), y = Emissions, fill =type)) + 
  geom_bar(stat= "identity", width = .4) + xlab("year") +
  ylab("Coal-Related PM2.5 Emissions") + 
  ggtitle("Total Coal-Related PM2.5 Emissions")

print(ggp)
dev.off() 