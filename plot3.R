dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subsetData <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

dateTime <- strptime(paste(subsetData$Date, subsetData$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
subMetering1 <- as.numeric(subsetData$Sub_metering_1)
subMetering2 <- as.numeric(subsetData$Sub_metering_2)
subMetering3 <- as.numeric(subsetData$Sub_metering_3)

png("plot3.png", width = 480, height = 480)
plot(dateTime, subMetering1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(dateTime, subMetering2, type = "l", col = "red")
lines(dateTime, subMetering3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 2.5)
dev.off()

