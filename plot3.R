## load and create clean dates
table <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.string="?")
Date2 <- as.Date(table$Date, "%d/%m/%Y")
table2 <- cbind(table, Date2)

## take out subset of dates
table3 <- subset(table2, Date2 >= as.Date("2007-02-01"))
energy <- subset(table3, Date2 <= as.Date("2007-02-02"))

## combine date and time
fd <- strptime(paste(energy$Date2, energy$Time, sep=" "), format = "%Y-%m-%d %H:%M:%S")
wd <- format(fd, "%a") # gives abbreviated weekday format

## plot 3
png(filename="plot3.png", height=480, width=480)
plot(fd, energy$Sub_metering_1, type="l", xlab="" , ylab="Energy sub metering", xaxt="n")
lines(fd, energy$Sub_metering_2, col="red")
lines(fd, energy$Sub_metering_3, col="blue")
axis.POSIXct(1, fd, format="%a", labels = TRUE)
legend("topright", col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1, 1, 1), lwd=2, cex=0.5)
dev.off()