## source link: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## downloaded February 05, 2015, 9:44:48 PM

file = "household_power_consumption.txt"
header <- read.csv(file, header = TRUE, nrow = 1, sep=";")   ## reading in column names
hpc <- read.csv(file, col.names = names(header), sep=";",    ## only reading in data for 2007-02-01 
                skip=66637, nrow=2880, header=FALSE)         ## and 2007-02-02
hpc <- within(hpc, DT <- paste(Date, Time, sep =" "))        ## creating new column w/ Date & Time
DateTime <- strptime(hpc[,10], format = "%d/%m/%Y %H:%M:%S") ## converting to POSIXct
hpc <- cbind(hpc, DateTime)
png(filename = "plot4.png", width = 480, height = 480)       ## opening PNG graphic device
par(mfcol = c(2, 2))                                         ## setting plot array layout
# plotting Global Active Power x Time
plot(hpc$DateTime, hpc$Global_active_power, type ="n",ylab="Global Active Power", xlab="")
lines(hpc$DateTime, hpc$Global_active_power)
# plotting Energy Sub Meter x Time
plot(hpc$DateTime, hpc$Sub_metering_1, type = "n", ylab =
       "Energy Sub Metering", xlab = "", mar = c(5,4,4,4))
lines(hpc$DateTime, hpc$Sub_metering_1)
lines(hpc$DateTime, hpc$Sub_metering_2, col="red")
lines(hpc$DateTime, hpc$Sub_metering_3, col="blue")
legend("topright", col = c("black", "red", "blue"), 
       lty = "solid", bty = "n", #cex = 0.75, pt.cex = 1, 
       legend = c("Sub_metering_1", "Sub_metering_2", 
                                "Sub_metering_3"))
# plotting Voltage x Time
plot(hpc$DateTime, hpc$Voltage, type ="n", xlab="datetime", 
     ylab ="Voltage")
lines(hpc$DateTime, hpc$Voltage)
# plotting Global Reactive Power x Time 
plot(hpc$DateTime, hpc$Global_reactive_power, type ="n", xlab="datetime", 
     ylab ="Global_reactive_power")
lines(hpc$DateTime, hpc$Global_reactive_power)
dev.off() 