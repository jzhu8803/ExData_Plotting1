x <- read.csv("household_power_consumption.txt", sep = ";")
x <- subset(x, Date == "1/2/2007" | Date == "2/2/2007")

x$Date <- strptime(x$Date, "%d/%m/%Y")  
x$Date <- as.Date(x$Date)  

x$Date_Time <- paste(x$Date, x$Time, sep = " ")
x$Date_Time <- strptime(x$Date_Time, "%Y-%m-%d %H:%M:%S")

x$Global_active_power <- as.character(x$Global_active_power)
x$Global_active_power <- as.numeric(x$Global_active_power)

png("Plot2.png", width = 480, height = 480)
with(x, plot(Date_Time, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)",type = "l", ylim = c(min(Global_active_power), max(Global_active_power))))
dev.off()