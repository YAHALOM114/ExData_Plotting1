Sys.setlocale("LC_TIME", "English")
library(dplyr)
fdata<- read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")
pdata<-fdata[(fdata$Date=="1/2/2007" | fdata$Date=="2/2/2007" ),]
rm(fdata)
pdata$DateTime<-strptime(paste(pdata$Date,pdata$Time),"%d/%m/%Y %H:%M:%S")
plot(pdata[,10], pdata[,3], type="l",xlab="" ,ylab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png")
dev.off()