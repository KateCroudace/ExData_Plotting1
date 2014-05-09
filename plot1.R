# read in whole data file
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
# restrict to required days
days<-data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
# try to recover some space
rm(data)
# create histogram of required data
hist(as.numeric(as.character(days$Global_active_power)),col="red", ylab="Frequency", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
# and save to file
dev.copy(png, file = "plot1.png", width=480, height=480, units = "px")
dev.off()