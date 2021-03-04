##Read text file into a table format
projectpower <- "household_power_consumption.txt"
powertable <- read.table(projectpower, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
powerdate <- powertable[powertable$Date %in% c("1/2/2007", "2/2/2007") ,]

##Open graphics device and make the plot
dayoftheweek <- strptime(paste(powerdate$Date, powerdate$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 
Activepower <- as.numeric(powerdate$Global_active_power)
png("plot2.png", width = 480, height = 480)
plot(dayoftheweek, Activepower, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

##Close graphics device
dev.off()