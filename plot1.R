##load data
if(!file.exists("./data")){dir.create("./data")}
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "./data/Fhousehold_power.zip")
unzip("./data/Fhousehold_power.zip")
dataSet <- read.table("household_power_consumption.txt",header = TRUE ,sep = ";",stringsAsFactors = FALSE)

##make subset
library(plyr); library(dplyr)
targetDate <- c("1/2/2007", "2/2/2007")
targetDateData <- filter(dataSet, Date %in% targetDate)

##plot and save a file
globalActivePower <- as.numeric(targetDateData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
