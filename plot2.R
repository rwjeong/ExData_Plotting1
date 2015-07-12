# Our overall goal here is simply to examine how household energy 
# usage varies over a 2-day period in February, 2007 using the data
# derived from data from the UC Irvine Machine Learning Repository, 
# a popular repository for machine learning datasets.

# You can download the source file from 
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

# The following datafile used is stored in a subfolder named
# ExploratoryDataAnalysis in the default working directory of R
# and I will store a reference to this file named "dataFile"
dataFile <- "./ExploratoryDataAnalysis/household_power_consumption.txt"

# next, I will read the text file into a table named "data". A 
# quick view of the file using Notepad++ shows me that the file's
# delimitter is a semi-colon along with some of the variables of
# mixed data types. e.g. dates, times, and decimals
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# next, I will pull a portion of the data set into a variable named
# "subData" for the working data set for the dates between 2007-02-01 
# and 2007-02-02. However, the date format is of D/M/Y in the file 
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# next, I will create the two evaluating variables DateTime and
# Global_active_power for the plot. In order to create one variable for
# DateTime, I will join the two to create the correct POSIXlt format
dateTime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gActivePower <- as.numeric(subData$Global_active_power)

# next, create a PNG file representation of the graph with a 
# size of 480x480 pixels and save in subfolder ExploratoryDataAnalysis
png("./ExploratoryDataAnalysis/plot2.png", width=480, height=480)

# next, create the line plot with the necessary formats and labels
plot(dateTime, gActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# lastly and very importantly, close the graphic device
dev.off()