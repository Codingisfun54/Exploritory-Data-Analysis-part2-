##Of the four types of sources indicated by the \color{red}{\verb|type|}type 
##(point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases 
##in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 
##1999–2008? Use the ggplot2 plotting system to make a plot answer this question.
NEI <- readRDS("C:/Users/willi/OneDrive/Desktop/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/willi/OneDrive/Desktop/Source_Classification_Code.rds")
Baltimore_City <- NEI[grep("24510", NEI[,1], ignore.case = FALSE),]

# Aggregate by sum the total emissions by year
aggregatedTotalByYear <- aggregate(Emissions ~ year + type , Baltimore_City, sum)

# Draw plot and save png

png("plot3.png",width=480,height=480)

g <- ggplot(aggregatedTotalByYear, aes(year, Emissions, color = type))
g <- g + geom_line()
print(g)
dev.off()