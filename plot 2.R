#Plot 2
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
subdata <- subset(data, data$Date == '2007-02-01' | data$Date == '2007-02-02')
subdata$Time <- strptime(paste(subdata$Date, subdata$Time, sep =" "), "%Y-%m-%d %H:%M:%S")
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)
png(filename = "plot2.png", width = 480, height = 480)
with(subdata, plot(Time ,Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)"))
dev.off()
