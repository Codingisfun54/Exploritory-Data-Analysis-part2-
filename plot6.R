##Compare emissions from motor vehicle sources in Baltimore City with 
##emissions from motor vehicle sources in Los Angeles County, California
##(\color{red}{\verb|fips == "06037"|}fips == "06037"). 
##Which city has seen greater changes over time in motor vehicle emissions?
NEI <- readRDS("C:/Users/willi/OneDrive/Desktop/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/willi/OneDrive/Desktop/Source_Classification_Code.rds")
Baltimore_City <- NEI[grep("24510", NEI[,1], ignore.case = FALSE),]
Car_Emissions <- Baltimore_City[grep("ON-ROAD",NEI[,5],ignore.case = FALSE),]
aggregatedTotalByYear <- aggregate(Emissions ~ year, Car_Emissions, sum)
png("plot15.png",width=480,height=480)
g <- ggplot(aggregatedTotalByYear,aes(year,Emissions))
g<- g + geom_line()
LA <- NEI[grep("24510", NEI[,1], ignore.case = FALSE),]
LA_Emissions <- LA[grep("ON-ROAD",NEI[,5],ignore.case = FALSE),]
LAaggregatedTotalByYear <- aggregate(Emissions ~ year, LA_Emissions, sum)
png("plot6.png",width=480,height=480)
l <- ggplot(LAaggregatedTotalByYear,aes(year,Emissions))
l<- l + geom_line()
print(l)
print(g)
dev.off()