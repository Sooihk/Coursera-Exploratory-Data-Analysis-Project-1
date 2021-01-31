#Load Data
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header = TRUE, sep = ";", dec = ".", stringsAsFactors = FALSE)
#subset data
subsetData <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
dateTime <- strptime(paste(subsetData$Date, subsetData$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

globalactivePower <- as.numeric(subsetData$Global_active_power)
voltage <- as.numeric(subsetData$Voltage)
globalreactivePower <- as.numeric(subsetData$Global_reactive_power)
subMetering1 <- as.numeric(subsetData$Sub_metering_1)
subMetering2 <- as.numeric(subsetData$Sub_metering_2)
subMetering3 <- as.numeric(subsetData$Sub_metering_3)

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

plot(dateTime, globalactivePower, xlab = "", ylab = "Global Active Power", type = "l", cex = 1 )
plot(dateTime, voltage, xlab = "datetime", ylab = "Voltage", type = "l")
plot(dateTime, subMetering1, ylab = "Energy sub metering", xlab = "", type = "l")
lines(dateTime, subMetering2, col = "red", type = "l")
lines(dateTime, subMetering3, col = "blue", type = "l")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 2.5, bty = "n")
plot(dateTime, globalreactivePower, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
dev.off()
