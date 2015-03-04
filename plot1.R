fdata<- read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")
pdata<-fdata[(fdata$Date=="1/2/2007" | fdata$Date=="2/2/2007" ),]
rm(fdata)
hist(pdata[,3], col="RED", main= "Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off()