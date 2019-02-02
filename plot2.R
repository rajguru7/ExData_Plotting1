data <- read.delim("household_power_consumption.txt",sep = ";")
data$Date<-as.Date(data$Date,format = "%d/%m/%Y")
data<-data[data$Date>='2007-02-01'&data$Date<='2007-02-02',]
data$Global_active_power<-as.numeric(levels(data$Global_active_power))[data$Global_active_power]
png(file="plot2.png",width = 480,height=480)
x<-as.POSIXct(paste(data$Date,data$Time),format = "%Y-%m-%d %H:%M:%OS")
plot(x,data$Global_active_power,ylab = 'Global Active Power(kilowatts)',main = '',xlab='',type = 'n')
lines(x,data$Global_active_power)
dev.off()
