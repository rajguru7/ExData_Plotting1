data <- read.delim("household_power_consumption.txt",sep = ";")
data$Date<-as.Date(data$Date,format = "%d/%m/%Y")
data<-data[data$Date>='2007-02-01'&data$Date<='2007-02-02',]
data$Sub_metering_2<-as.numeric(levels(data$Sub_metering_2))[data$Sub_metering_2]
data$Sub_metering_1<-as.numeric(levels(data$Sub_metering_1))[data$Sub_metering_1]
data$Sub_metering_3<-as.numeric(levels(data$Sub_metering_3))[data$Sub_metering_3]
data$Global_active_power<-as.numeric(levels(data$Global_active_power))[data$Global_active_power]
data$Global_reactive_power<-as.numeric(levels(data$Global_reactive_power))[data$Global_reactive_power]
data$Voltage<-as.numeric(levels(data$Voltage))[data$Voltage]
png(file="plot4.png",width = 480,height=480)
par(mfcol=c(2,2))
x<-as.POSIXct(paste(data$Date,data$Time),format = "%Y-%m-%d %H:%M:%OS")
plot(x,data$Global_active_power,ylab = 'Global Active Power',main = '',xlab='',type = 'n')
lines(x,data$Global_active_power)
plot(x,data$Sub_metering_1,ylab = 'Energy sub metering',main = '',xlab='',type = 'n')
lines(x,data$Sub_metering_1)
lines(x,data$Sub_metering_2,col='red')
lines(x,data$Sub_metering_3,col='blue')
legend("topright",legend = c('Sub metering 1','Sub metering 2','Sub metering 3'),col=c('black','red','blue'),lty = 1)
plot(x,data$Voltage,ylab = 'Voltage',main = '',xlab='datetime',type = 'n')
lines(x,data$Voltage)
plot(x,data$Global_reactive_power,ylab = 'Global_reactive_power',main = '',xlab='datetime',type = 'n')
lines(x,data$Global_reactive_power)
dev.off()
