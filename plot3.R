##Read text file into a table format
projectpower <- "household_power_consumption.txt"
powertable <- read.table(projectpower, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
powerdate <- powertable[powertable$Date %in% c("1/2/2007", "2/2/2007") ,]

##Set variables
dayoftheweek <- strptime(paste(powerdate$Date, powerdate$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 
Activepower <- as.numeric(powerdate$Global_active_power)
submeter1 <- as.numeric(powerdate$Sub_metering_1)
submeter2 <- as.numeric(powerdate$Sub_metering_2)
submeter3 <- as.numeric(powerdate$Sub_metering_3)

#Open graphics device and make plot
png("plot3.png", width = 480, height = 480)
plot(dayoftheweek, Activepower, type = "l", xlab = "", ylab = "Energy sub metering", ylim = c(0,30))
lines(dayoftheweek, submeter1)
lines(dayoftheweek, submeter2, col = "red")
lines(dayoftheweek, submeter3, col = "blue")

##make legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col=c("black", "red", "blue"))

##Close graphics device
dev.off() 