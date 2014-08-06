## Course Project 1
## Plot 1
## Read in only portion of the available data, in this case from Feb 1, 2007 to Feb 2, 2007
## The SQL DF Library is required for this

library(sqldf)

## make a path and file string
filepath <-"C:/Users/B/Documents/AeroFS/SF/001Lrn/003DataScience/Coursera-Resources/Coursera-JHU-ExploratoryDataAnAug2014/Projects"
filName <- "household_power_consumption.txt"
setwd(filepath)

## read file and select rows based on string "1/1/2007" and store in dataframe 'inp'
inp <- read.csv.sql(filName, sep=";",sql = 'select * from file where Date = "1/2/2007" OR Date = "2/2/2007"')

## set margins for plot
par(mar=c(5,4,4,2))

##generate the plot
hist(inp$Global_active_power, main="Global Active Power", col="Red", xlab="Global Active Power (kilowatts)", ylim=c(0,1200))

## copy the plot from active Window to PNG device and then close the device
dev.copy(png, file="plot1.png")
dev.off()
