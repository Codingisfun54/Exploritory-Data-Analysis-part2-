NEI <- readRDS("C:/Users/willi/OneDrive/Desktop/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/willi/OneDrive/Desktop/Source_Classification_Code.rds")

aggregatedTotalByYear <- aggregate(Emissions ~ year, NEI, sum)
png("plot1.png",width=480,height=480)
with(aggregatedTotalByYear, plot(Emissions ~ year))

dev.off()