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

## plot 2
png(filename="plot2.png", height=480, width=480)
plot(fd, energy$Global_active_power, type="l", xlab="" , ylab="Global Active Power (kilowatts)", xaxt="n") 
axis.POSIXct(1, fd, format="%a", labels = TRUE) #side 1 = x axis %a is abbr weekday
dev.off()