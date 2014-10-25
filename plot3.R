#plot3
library("ggplot2")

# Reading the data of Baltimore
NEI <- readRDS("summarySCC_PM25.rds") 
NEI <- NEI[NEI$fips == "24510", ] 
 
# Getting the total emission per year for each type
total <- aggregate(x = NEI$Emissions, by = list(Year = NEI$year, Type = NEI$type, SCC = NEI$SCC), FUN = sum) 
total <- aggregate(x = total$x,       by = list(Type = total$Type, Year = total$Year),            FUN = sum) 
 
#creating the plot 
png("plot3.png") 
qplot(year, x, data = total, geom=c("point","line"), color=Type, main= "Baltimore city yearly emissions", xlab= "year", ylab= "emissions") 
dev.off() 
