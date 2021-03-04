##Read text file into a table format
projectpower <- "household_power_consumption.txt"
powertable <- read.table(projectpower, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
powerdate <- powertable[powertable$Date %in% c("1/2/2007", "2/2/2007") ,]

##Open graphics device and make the plot
Activepower <- as.numeric(powerdate$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(Activepower, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

##Close graphics device
dev.off()