#Loading data
hcp <- read.csv("hpc.txt", sep=";", na.strings = "?", colClasses = c("character","character", "numeric", "numeric","numeric","numeric","numeric","numeric","numeric"))
#Converting date/time
hcp$Date <- as.Date(hcp$Date, "%d/%m/%Y")
hcp$Time <- strptime(paste(hcp$Date,hcp$Time), "%Y-%m-%d %H:%M:%S")
#Filtering dates
sub <- subset(hcp,hcp$Date >= as.Date("2007-02-01",format="%Y-%m-%d") & hcp$Date <= as.Date("2007-02-02",format="%Y-%m-%d") )
#Creating png device
png(filename = "plot3.png", height = 480, width = 480)
#Creating the plot
plot(sub$Time,sub$Sub_metering_1,type = "l", ylab = "Energy sub metering", xlab = "")
lines(sub$Time,sub$Sub_metering_2,type="l", col="red")
lines(sub$Time,sub$Sub_metering_3,type="l", col="blue")
legend("topright", pch = "-", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),text.width = strwidth("Sub_metering_1"), lwd = 2)
#Closing device
dev.off()