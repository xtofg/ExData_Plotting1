a <- read.csv("household_power_consumption.txt",sep=";", na.strings="?")
a$DateTime <-strptime(paste(a$Date,a$Time),"%d/%m/%Y %H:%M:%S")

sel <- as.Date(a$DateTime) >= as.Date("2007-02-01") & as.Date(a$DateTime) <= as.Date("2007-02-02")
a <- a[sel,]

png(filename="plot2.png")

with(a,plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

dev.off()
