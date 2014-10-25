#plot4

# Reading the desired portion of the data, Related to Coal Combustion
SCC <- readRDS("Source_Classification_Code.rds") 
SCC <- SCC[grepl("Combustion", SCC$SCC.Level.One, ignore.case=TRUE) | grepl("Coal", SCC$SCC.Level.Three, ignore.case=TRUE), 1]   
NEI <- readRDS("summarySCC_PM25.rds") 
NEI <- NEI[NEI$SCC == SCC$SCC, ] 
 
# Getting total emissions per year  
total <- aggregate(x = NEI$Emissions, by = list(year = NEI$year, SCC = NEI$SCC), FUN = sum) 
total <- aggregate(x ~ year), data = total, FUN = sum) 

# Plotting 
png("plot4.png") 
plot(total$year, total$x, type = "l", main= "Coal Emissions per year", xlab= "year", ylab= "emissions") 
dev.off() 
