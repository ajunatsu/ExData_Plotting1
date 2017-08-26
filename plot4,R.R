hpc<-read.table("household_power_consumption.txt",header = TRUE,sep=";",na.strings = c("?"))
hpc<-na.omit(hpc)

hpc$Date<-as.Date(hpc$Date,format="%d/%m/%Y")
hpc$Time<-strptime(paste(hpc$Date,hpc$Time), "%Y-%m-%d %H:%M:%OS")
hpcdata<-hpc[hpc$Date>=as.Date("2007-02-01") & hpc$Date<=as.Date("2007-02-02"),]

par(mfcol=c(2,2))
par(mar=c(4,4,1,1))

plot(hpcdata$Time,hpcdata$Global_active_power,type="l",col="blue",ylab="Global Active Power (Kilowatts",xlab="Time")

plot(hpcdata$Time,hpcdata$Sub_metering_1,type="n",xlab="TIme",ylab="Energy Sub Metering")
points(hpcdata$Time,hpcdata$Sub_metering_1,type="l")
points(hpcdata$Time,hpcdata$Sub_metering_2,type="l",col="red")
points(hpcdata$Time,hpcdata$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"),cex=0.6, pt.cex = 1)

plot(hpcdata$Time,hpcdata$Voltage,type="l",xlab="dateTime",ylab="Voltage")
plot(hpcdata$Time,hpcdata$Global_reactive_power,type="l",xlab="dateTime",ylab="Global Reactive Power")

dev.copy(png,"plot4.png")
dev.off()