## source link: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## downloaded February 05, 2015, 9:44:48 PM

file = "household_power_consumption.txt"
header <- read.csv(file, header = TRUE, nrow = 1, sep=";")   ## reading in column names
hpc <- read.csv(file, col.names = names(header), sep=";",    ## only reading in data for 2007-02-01 
                skip=66637, nrow=2880, header=FALSE)         ## and 2007-02-02
png(filename = "plot1.png", width = 480, height = 480)       ## opening PNG graphic device
hist(hpc$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off() 