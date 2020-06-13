#The file has been extracted and stored in a file named "household_power_consumption.txt"
new_data <- read.table("household_power_consumption.txt", header = T, sep=";", stringsAsFactors=FALSE, dec=".")
# Now a variable new_data is created that stores all the data from the text file
#A new variable has been created name reqdates that subsets all the data from "1/2/2007" to "2/2/2007"
reqdates <- new_data[new_data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(reqdates$Date, reqdates$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
#A new png file is created that will store the Plot2
png("plot2.png")
#Now the plotting is done
plot(datetime, as.numeric(reqdates$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
