x <- read.csv("household_power_consumption.txt", sep = ";")
x <- subset(x, Date == "1/2/2007" | Date == "2/2/2007")

x$Date <- strptime(x$Date, "%d/%m/%Y")  
x$Date <- as.Date(x$Date)  

x$Date_Time <- paste(x$Date, x$Time, sep = " ")
x$Date_Time <- strptime(x$Date_Time, "%Y-%m-%d %H:%M:%S")

x$Global_active_power <- as.character(x$Global_active_power)
x$Global_active_power <- as.numeric(x$Global_active_power)

png("Plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

with(x, plot(Date_Time, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)",type = "l", ylim = c(min(Global_active_power), max(Global_active_power))))

with(x, plot(Date_Time, as.numeric(as.character(Voltage)), type = "l", xlab = "datetime", ylab = "Voltage"))

x$Sub_metering_1 <- as.numeric(as.character(x$Sub_metering_1))
x$Sub_metering_2 <- as.numeric(as.character(x$Sub_metering_2))

plot(x$Date_Time, x$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub merging")
lines(x$Date_Time, x$Sub_metering_2, col = "red")
lines(x$Date_Time, x$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), bty = "n", legend = c("Sub_merging_1", "Sub_merging_2", "Sub_merging_3"), lty = 1)

with(x, plot(Date_Time, as.numeric(as.character(Global_reactive_power)), type = "l", xlab = "datetime", ylab = "Global_reactive_power"))

dev.off()