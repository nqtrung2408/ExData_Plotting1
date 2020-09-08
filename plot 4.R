#Plot 4
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$Voltage <- as.numeric(data$Voltage)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)

subdata <- subset(data, data$Date == '2007-02-01' | data$Date == '2007-02-02')
subdata$Time <- strptime(paste(subdata$Date, subdata$Time, sep =" "), "%Y-%m-%d %H:%M:%S")

png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

#Sub Plot 1
subdata1 <- subdata
with(subdata1, plot(Time ,Global_active_power, type = "l", ylab = "Global Active Power"))

#Sub Plot 2
subdata2 <- subdata
with (subdata2, plot(Time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

#Sub Plot 3
subdata3 <- subdata
with(subdata3,  plot(Time ,Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(subdata3, points(Time, Sub_metering_2, type = "l", col = "red"))
with(subdata3, points(Time, Sub_metering_3, type = "l", col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1,1,1), cex = 1, bty = "n")

#Sub Plot 4
subdata4 <- subdata
with(subdata4, plot(Time, Global_reactive_power, type ="l", ylab = "Global_reactive_power", xlab = "datetime"))

dev.off()