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
png("plot2.png")
plot(dates, data$Global_active_power, xlab = "", main = "",
     ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()
