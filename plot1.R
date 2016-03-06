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