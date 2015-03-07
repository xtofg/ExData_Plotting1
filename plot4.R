a <- read.csv("household_power_consumption.txt",sep=";", na.strings="?")
a$DateTime <-strptime(paste(a$Date,a$Time),"%d/%m/%Y %H:%M:%S")

sel <- as.Date(a$DateTime) >= as.Date("2007-02-01") & as.Date(a$DateTime) <= as.Date("2007-02-02")
a <- a[sel,]

png(filename="plot4.png")

par(mfrow=c(2,2))

with(a,plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power"))

with(a,plot(DateTime,Voltage,type="l"))

with(a, {
  plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(DateTime, Sub_metering_2, col="red")
  lines(DateTime, Sub_metering_3, col="blue")
}
)
legend("topright", bty="n", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(a,plot(DateTime,Global_reactive_power,type="l"))

dev.off()

par(mfrow=c(1,1)) # for later...
