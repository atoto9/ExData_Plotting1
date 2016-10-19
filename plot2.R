##load data
if(!file.exists("./data")){dir.create("./data")}
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "./data/Fhousehold_power.zip")
unzip("./data/Fhousehold_power.zip")
dataSet <- read.table("household_power_consumption.txt",header = TRUE ,sep = ";", stringsAsFactors = FALSE)

##make subset
library(plyr); library(dplyr)
targetDate <- c("1/2/2007", "2/2/2007")
targetDateData <- filter(dataSet, Date %in% targetDate)

##format dateTime
dateTime <- paste(targetDateData$Date, targetDateData$Time, sep = " ")
formatTime <- strptime(dateTime, "%d/%m/%Y %H:%M:%S")
targetDateData <- cbind(targetDateData, formatTime)

##plot and save a file
png("plot2.png", width=480, height=480)
plot(targetDateData$formatTime, targetDateData$Global_active_power, type = "l", xlab = "",ylab="Global Active Power (kilowatts)")
dev.off()
