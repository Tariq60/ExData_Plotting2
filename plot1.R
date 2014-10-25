# plot1

# Reading the Data 
NEI <- readRDS("summarySCC_PM25.rds") 

# Getting the total emisssions per year 
total <- aggregate(x = NEI$Emissions, by = list(year = NEI$year, SCC = NEI$SCC), FUN = sum) 
total <- aggregate(x ~ year, data = total, FUN = sum) 
 
# Plotting
png("plot1.png") 
plot(total$year, total$x, type = "l", main= "Emissions per year", xlab= "year", ylab= "emissions") 
dev.off()

