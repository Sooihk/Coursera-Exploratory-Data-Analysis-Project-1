#Load, name and subsett power consumption dataset
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subsetData <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

#Plotting
globalactivePower <- as.numeric(subsetData$Global_active_power)
png("plot1.png")
hist(globalactivePower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()