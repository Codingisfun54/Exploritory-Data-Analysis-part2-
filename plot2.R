##Have total emissions from PM2.5 decreased in the 
##Baltimore City, Maryland (\color{red}{\verb|fips == "24510"|}fips == "24510") from 1999 to 2008? 
##Use the base plotting system to make a plot answering this question.
NEI <- readRDS("C:/Users/willi/OneDrive/Desktop/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/willi/OneDrive/Desktop/Source_Classification_Code.rds")
Baltimore_City <- NEI[grep("24510", NEI[,1], ignore.case = FALSE),]
aggregatedTotalByYear <- aggregate(Emissions ~ year, Baltimore_City, sum)
png("plot2.png",width=480,height=480)
with(aggregatedTotalByYear, plot(Emissions ~ year))

dev.off()