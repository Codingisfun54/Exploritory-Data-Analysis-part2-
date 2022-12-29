##Across the United States, how have emissions from coal 
##combustion-related sources changed from 1999–2008?
NEI <- readRDS("C:/Users/willi/OneDrive/Desktop/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/willi/OneDrive/Desktop/Source_Classification_Code.rds")

#merge data
mrg <- merge(NEI,SCC,by="SCC")
coal_combustion <- mrg[grep("coal", mrg[,8], ignore.case = TRUE),]
aggregatedTotalByYear <- aggregate(Emissions ~ year, coal_combustion, sum)
png("plot4.png",width=480,height=480)
g <- ggplot(aggregatedTotalByYear, aes(year, Emissions))
g <- g + geom_line()
print(g)
dev.off()