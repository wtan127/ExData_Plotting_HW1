# ExData_Plotting_HW1
Exploratory Data Analysis Homework 1: Generate 4 Plots

## load and create clean dates
table <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.string="?")
Date2 <- as.Date(table$Date, "%d/%m/%Y")
table2 <- cbind(table, Date2)

## take out subset of dates
table3 <- subset(table2, Date2 >= as.Date("2007-02-01"))
energy <- subset(table3, Date2 <= as.Date("2007-02-02"))

## plot1
png(filename="plot1.png", height=480, width=480)
par(mfrow=c(1,1))
hist(energy$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab = "Frequency",     yaxt="n")
axis(2, at=seq(0, 1200, 200), cex.axis=0.5) #change labels on axis
dev.off()

## combine date and time
fd <- strptime(paste(energy$Date2, energy$Time, sep=" "), format = "%Y-%m-%d %H:%M:%S")
wd <- format(fd, "%a") # gives abbreviated weekday format

## plot 2
png(filename="plot2.png", height=480, width=480)
plot(fd, energy$Global_active_power, type="l", xlab="" , ylab="Global Active Power (kilowatts)", xaxt="n") 
axis.POSIXct(1, fd, format="%a", labels = TRUE) #side 1 = x axis %a is abbr weekday
dev.off()

## plot 3
png(filename="plot3.png", height=480, width=480)
plot(fd, energy$Sub_metering_1, type="l", xlab="" , ylab="Energy sub metering", xaxt="n")
lines(fd, energy$Sub_metering_2, col="red")
lines(fd, energy$Sub_metering_3, col="blue")
axis.POSIXct(1, fd, format="%a", labels = TRUE)
legend("topright", col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1, 1, 1), lwd=2, cex=0.5)
dev.off()

## plot 4
png(filename="plot4.png", height=480, width=480)

## set 4 graphs
par(mfrow=c(2,2), mar=c(4, 4, 2, 2), cex=0.5) # all plots on one page

#topleft is plot2
plot(fd, energy$Global_active_power, type="l", xlab="" , ylab="Global Active Power (kilowatts)", xaxt="n")
axis.POSIXct(1, fd, format="%a", labels = TRUE)

#topright is Voltage/datetime
plot(fd, energy$Voltage, type="l", xlab="datetime" , ylab="Voltage", xaxt="n")
axis.POSIXct(1, fd, format="%a", labels = TRUE)

#bottomeleft is plot3
plot(fd, energy$Sub_metering_1, type="l", xlab="" , ylab="Energy sub metering", xaxt="n")
lines(fd, energy$Sub_metering_2, col="red")
lines(fd, energy$Sub_metering_3, col="blue")
axis.POSIXct(1, fd, format="%a", labels = TRUE)
legend("topright", col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1, 1, 1), lwd=2)

#bottomright Global_reative_power/datetime
plot(fd, energy$Global_reactive_power, type="l", xlab="datetime" , ylab="Global_reactive_power", xaxt="n")
axis.POSIXct(1, fd, format="%a", labels = TRUE)

dev.off()
