##How have emissions from motor vehicle sources
##changed from 1999–2008 in Baltimore City?
NEI <- readRDS("C:/Users/willi/OneDrive/Desktop/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/willi/OneDrive/Desktop/Source_Classification_Code.rds")
Baltimore_City <- NEI[grep("24510", NEI[,1], ignore.case = FALSE),]
Car_Emissions <- Baltimore_City[grep("ON-ROAD",NEI[,5],ignore.case = FALSE),]
aggregatedTotalByYear <- aggregate(Emissions ~ year, Car_Emissions, sum)
png("plot5.png",width=480,height=480)
g <- ggplot(aggregatedTotalByYear,aes(year,Emissions))
g<- g + geom_line()
print(g)
dev.off()