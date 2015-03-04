Sys.setlocale("LC_TIME", "English")
library(dplyr)
fdata<- read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")
pdata<-fdata[(fdata$Date=="1/2/2007" | fdata$Date=="2/2/2007" ),]
rm(fdata)
pdata$DateTime<-strptime(paste(pdata$Date,pdata$Time),"%d/%m/%Y %H:%M:%S")

par(mfrow = c(2,2))

plot(pdata[,10], pdata[,3], type="l",xlab="" ,ylab="Global Active Power")

plot(pdata[10], pdata[,5], type="l", xlab="datetime", ylab="Voltage")

plot(pdata[,10], pdata[,7], type="n", ylab="Energy sub metering", xlab="")
lines(x=pdata[,10],y=pdata[,7], col="black")
lines(x=pdata[,10],y=pdata[,8], col="red")
lines(x=pdata[,10],y=pdata[,9], col="blue")
legend("topright",bty="n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1, col=c("black","red","blue"))

plot(pdata[10], pdata[,4], type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file = "plot4.png")
dev.off()