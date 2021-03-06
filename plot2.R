#Loading data
hcp <- read.csv("hpc.txt", sep=";", na.strings = "?", colClasses = c("character","character", "numeric", "numeric","numeric","numeric","numeric","numeric","numeric"))
#Converting date/time
hcp$Date <- as.Date(hcp$Date, "%d/%m/%Y")
hcp$Time <- strptime(paste(hcp$Date,hcp$Time), "%Y-%m-%d %H:%M:%S")
#Filtering dates
ap <- subset(hcp,hcp$Date >= as.Date("2007-02-01",format="%Y-%m-%d") & hcp$Date <= as.Date("2007-02-02",format="%Y-%m-%d") )
#Creating png device
png(filename = "plot2.png", height = 480, width = 480)
#Creating the plot
plot(ap$Time,ap$Global_active_power,type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
#Closing device
dev.off()