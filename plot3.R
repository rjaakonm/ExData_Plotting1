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

## Generating Plot 3, (day labels in German)
png("plot3.png", width=480, height=480)
par(bg = "transparent")

plot(finalData$SetTime, finalData$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(finalData$SetTime, finalData$Sub_metering_2, col="red")
lines(finalData$SetTime, finalData$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1),col=c("black","red","blue"))

#dev.copy(png, "plot3.png", width = 480, height = 480)
dev.off()