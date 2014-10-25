#plot2

# Reading the data of Baltimore
NEI <- readRDS("summarySCC_PM25.rds") 
NEI <- NEI[NEI$fips == "24510", ] 
 
# Getting the total emisssions per year
total <- aggregate(x = NEI$Emissions, by = list(year = NEI$year, SCC = NEI$SCC), FUN = sum) 
total <- aggregate(x ~ year), data = total, FUN = sum) 
 
# Plotting 
png("plot2.png") 
plot(total$Year, total$x, type = "l", main= "Baltimore city yearly emissions", xlab= "year", ylab= "emissions") 
dev.off() 
