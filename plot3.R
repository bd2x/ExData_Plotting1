## Course Project 1
## Plot 3
## Read in only portion of the available data, in this case from Feb 1, 2007 to Feb 2, 2007
## The SQL DF Library is required for this

library(sqldf)

## make a path and file string
filepath <-"C:/Users/B/Documents/AeroFS/SF/001Lrn/003DataScience/Coursera-Resources/Coursera-JHU-ExploratoryDataAnAug2014/Projects"
filName <- "household_power_consumption.txt"
setwd(filepath)

## read file and select rows based on string "1/1/2007" and store in dataframe 'inp'
inp <- read.csv.sql(filName, sep=";",sql = 'select * from file where Date = "1/2/2007" OR Date = "2/2/2007"')

##Convert Date and Time variables from character to POSIX
dt <- strptime(paste(inp$Date,inp$Time), "%d/%m/%Y %H:%M:%S")
## set margins for plot
par(mar=c(5,4,4,2))

##Instead of copying plot from Windows device, formatting works better by directly exporting to png
png(filename="plot3.png", width=480, height=480, units='px')

##generate the time series line plot, remove the xlabel which gets added by default
plot(dt, inp$Sub_metering_1, type="l", xlab=NA, ylab="Energy sub metering")
lines(dt, inp$Sub_metering_2, type="l", col="Red", xlab=NA, ylab="Global Active Power (kW)" )
lines(dt, inp$Sub_metering_3, type="l", col="Blue",xlab=NA, ylab="Global Active Power (kW)")
#legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1, col=c('black','red','blue'))
legend("topright", names(inp)[7:9],lty=1, col=c('black','red','blue'))

## copy the plot from active Window to PNG device and then close the device
#dev.copy(png, file="plot3.png")
dev.off()
