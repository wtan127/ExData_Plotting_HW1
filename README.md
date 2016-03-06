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
par(mfrow=c(1,1))
hist(energy$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab = "Frequency", yaxt="n")
axis(2, at=seq(0, 1200, 200), cex.axis=0.75) #change labels on axis

## set dev for PNG (ADD AT END)
#png(filename="plot1.png", height=480, width=480)

## combine date and time
## y <- strptime(x, format= "%T") ## formats time, don't need this
## paste(Dates2, Time, sep=" ")  # paste date to unformatted time
fd <- strptime(paste(energy$Dates2, energy$Time, sep=" "), format = "%Y-%m-%d %H:%M:%S")
wd <- format(fd, "%a") # gives abbreviated weekday format

## plot 2
plot(fd, energy$Global_active_power, type="l", xlab="" , ylab="Global Active Power (kilowatts)", xaxt="n") 
axis.POSIXct(1, fd, format="%a", labels = TRUE) #side 1 = x axis %a is abbr weekday

#http://www.harding.edu/fmccown/r/

## plot 3
pcolors <- c("black", "red", "blue")


lines(y, p, col="red") # lines adds new line to same plot
## add legend to upper right of plot3


## set 4 graphs
par(mfrow=c(2,2), mar=c(0.5, 0.5, 0.5, 0.5)) # all plots on one page, may or may not need margin change

## plot 4

## turn dev for PNG off
#dev.off()
