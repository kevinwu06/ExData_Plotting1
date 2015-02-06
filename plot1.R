file = "household_power_consumption.txt"
header <- read.csv(file, header = TRUE, nrow = 1, sep=";")   ## reading in column names
hpc <- read.csv(file, col.names = names(header), sep=";",    ## only reading in data for 2007-02-01 
                skip=66637, nrow=2880, header=FALSE)         ## and 2007-02-02
hpc <- within(hpc, DT <- paste(Date, Time, sep =" "))        ## creating new column w/ Date & Time
DateTime <- strptime(hpc[,10], format = "%d/%m/%Y %H:%M:%S") ## converting to POSIXct
hpc <- cbind(hpc, DateTime)
hist(hpc$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")                            ## Copy my plot to a PNG file
dev.off() 