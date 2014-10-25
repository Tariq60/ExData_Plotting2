#plot5

# Reading the desired portion of the data 
SCC <- readRDS("Source_Classification_Code.rds") 
SCC <- SCC[grepl("Vehicle", SCC$EI.Sector, ignore.case=TRUE) | grepl("Motor", SCC$EI.Sector, ignore.case=TRUE), 1]  
NEI <- readRDS("summarySCC_PM25.rds") 
NEI <- NEI[NEI$SCC == SCC$SCC && NEI$fips == "24510", ]
 
# Getting total emissions per year
total <- aggregate(x = NEI$Emissions, by = list(year = NEI$year, SCC = NEI$SCC), FUN = sum) 
total <- aggregate(x ~ year), data = total, FUN = sum) 
 
# Plotting 
png("plot5.png") 
plot(total$year, total$x, type = "l", main= "Emissions per year from motor vehicles in Baltimore", xlab= "year", ylab= "emissions") 
dev.off() 
