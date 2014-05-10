data <- read.table("household_power_consumption.txt", na.strings = "?",
                   colClasses = c("Date", "character", "numeric", "numeric",
                                  "numeric", "numeric", "numeric", "numeric",
                                  "numeric"),
                   col.names = c("Date", "Time", "Global_active_power",
                                "Global_reactive_power", "Voltage",
                                "Global_intensity", "Sub_metering_1",
                                "Sub_metering_2", "Sub_metering_3"),
                   sep = ";", skip=66636, nrows=2880)
png("plot1.png")
hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)",
     col = "red", main = "Gloabal Active Power")
dev.off()
