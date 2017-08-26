hpc<-read.table("household_power_consumption.txt",header = TRUE,sep=";",na.strings = c("?"))
hpc<-na.omit(hpc)

hpc$Date<-as.Date(hpc$Date,format="%d/%m/%Y")
hpc$Time<-strptime(paste(hpc$Date,hpc$Time), "%Y-%m-%d %H:%M:%OS")
hpcdata<-hpc[hpc$Date>=as.Date("2007-02-01") & hpc$Date<=as.Date("2007-02-02"),]

plot(hpcdata$Time,hpcdata$Global_active_power,type="l",col="blue",ylab="Global Active Power (Kilowatts",xlab="Time")

dev.copy(png,"plot2.png")
dev.off()