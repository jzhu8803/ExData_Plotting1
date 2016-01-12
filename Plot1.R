x <- read.csv("household_power_consumption.txt", sep = ";")

x <- subset(x, Date == "1/2/2007" | Date == "2/2/2007")

x$Date <- strptime(x$Date, "%d/%m/%Y")  
x$Date <- as.Date(x$Date)  

x$Day <- weekdays(x$Date, abbreviate = T)

x$Global_active_power <- as.character(x$Global_active_power)
x$Global_active_power <- as.numeric(x$Global_active_power, na.rm = T)

png("Plot1.png", width = 480, height = 480)
hist(x$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
dev.off()