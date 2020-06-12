#The file has been extracted
new_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#A new variable has been created name reqdates that subsets all the data from "1/2/2007" to "2/2/2007"
reqdates <- reqdates <- new_data[new_data$Date %in% c("1/2/2007","2/2/2007") ,]
#A new png file is created that will store the Plot1
png("plot1.png")
hist(as.numeric(new_data$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()