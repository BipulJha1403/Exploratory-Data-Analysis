#The file has been extracted and stored in a file named "household_power_consumption.txt"
new_data <- read.table("household_power_consumption.txt", header = T, sep=";", stringsAsFactors=FALSE, dec=".")
# Now a variable new_data is created that stores all the data from the text file
#A new variable has been created name reqdates that subsets all the data from "1/2/2007" to "2/2/2007"
reqdates <- new_data[new_data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(reqdates$Date, reqdates$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
global_active_power <- as.numeric(reqdates$Global_active_power)
global_reactive_power <- as.numeric(reqdates$Global_reactive_power)
voltage <- as.numeric(reqdates$Voltage)
subMetering1 <- as.numeric(reqdates$Sub_metering_1)
subMetering2 <- as.numeric(reqdates$Sub_metering_2)
subMetering3 <- as.numeric(reqdates$Sub_metering_3)
#A new png file is created that will store the Plot4
png("plot4.png")
par(mfrow = c(2, 2)) 
plot(datetime, global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab=" ")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
plot(datetime, global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
