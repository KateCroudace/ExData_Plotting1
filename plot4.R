# read in whole data file
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
# restrict to required days
days<-data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
# try to recover some space
rm(data)
# combine first two columns into Date/Time
dates<-paste(days$Date,days$Time)
# and convert to DateTime class
full_date<-strptime(dates,"%d/%m/%Y %H:%M:%S")
# add in as extra column
data<-cbind(full_date, days)
# plot required data
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(1, 1, 0, 1))
with (data,{
  plot(full_date, as.numeric(as.character(Global_active_power)),cex.lab = 0.6, cex.axis= 0.6,type ="l", xlab="",ylab="Global Active Power")
  plot(full_date, as.numeric(as.character(Voltage)), cex.lab = 0.6,cex.axis = 0.6,type = "l", xlab="datetime", ylab= "Voltage")
  plot(full_date, as.numeric(as.character(Sub_metering_1)), cex.axis=0.6,cex.lab=0.6,type ="l", xlab="",ylab="Energy sub metering")
  lines(full_date, as.numeric(as.character(Sub_metering_2)),  col="red")
  lines(full_date, as.numeric(as.character(Sub_metering_3)),  col="blue")
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), xjust=1,bty="n",cex=0.5, lty=c(1,1,1), col = c("black", "red", "blue"))
  plot(full_date, as.numeric(as.character(Global_reactive_power)), cex.lab=0.6, cex.axis=0.6, type="l",xlab="datetime", ylab= "Global_reactive_power")
})
# and copy to file
dev.copy(png, file = "plot4.png", width=480, height=480, units = "px")
dev.off()