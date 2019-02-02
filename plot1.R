data <- read.delim("household_power_consumption.txt",sep = ";")
data$Date<-as.Date(data$Date,format = "%d/%m/%Y")
data<-data[data$Date>='2007-02-01'&data$Date<='2007-02-02',]
data$Global_active_power<-as.numeric(levels(data$Global_active_power))[data$Global_active_power]
png(file="plot1.png",width = 480,height=480)
hist(data$Global_active_power,col='red',xlab = 'Global Active Power(kilowatts)',main = 'Global Active Power')
dev.off()
