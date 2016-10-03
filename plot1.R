setwd("C:/Users/rjaakonm/Desktop/R/WORKSPACE/exploratory data analysis")

#download the data
if(!file.exists('data.zip')){
        url<-"http://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
        
        download.file(url,destfile = "data.zip")
}
#unzip
unzip("data.zip")

#read the data
data<-read.table("household_power_consumption.txt",header = TRUE, sep= ";", na.strings="?")

## set time variable
finalData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(finalData$Date, finalData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finalData <- cbind(SetTime, finalData)

## Generating Plot 1
hist(finalData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()

      
