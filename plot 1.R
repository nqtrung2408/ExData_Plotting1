#Plot 1
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")
data$Date <- as.Date(data$Date, '%d/%m/%Y')
data$Global_active_power <- as.numeric(data$Global_active_power)
subdata <- subset(data, data$Date == '2007-02-01' | data$Date == '2007-02-02')
png(filename = "plot1.png", width = 480, height = 480)
hist(subdata$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")
dev.off()