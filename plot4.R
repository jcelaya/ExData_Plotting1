data <- read.table("household_power_consumption.txt", na.strings = "?",
                   colClasses = c("character", "character", "numeric", "numeric",
                                  "numeric", "numeric", "numeric", "numeric",
                                  "numeric"),
                   col.names = c("Date", "Time", "Global_active_power",
                                 "Global_reactive_power", "Voltage",
                                 "Global_intensity", "Sub_metering_1",
                                 "Sub_metering_2", "Sub_metering_3"),
                   sep = ";", skip=66637, nrows=2880)
dates <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
png("plot4.png")

par(mfcol = c(2, 2))

# First plot
plot(dates, data$Global_active_power, xlab = "", main = "",
     ylab = "Global Active Power", type = "l")

# Second plot
plot(dates, data$Sub_metering_1, xlab = "", main = "",
     ylab = "Energy sub metering", type = "l", col = "black")
points(dates, data$Sub_metering_2, type = "l", col = "red")
points(dates, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = 1, bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Third plot
plot(dates, data$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage", main = "")

# Fourth plot
plot(dates, data$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power", main = "")

dev.off()
