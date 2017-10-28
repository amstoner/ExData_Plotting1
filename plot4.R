rm(list=ls())   # delete all old variables
dat <- read.table("household_power_consumption.txt",header=T,sep=';',stringsAsFactors = F,na.strings='?',colClasses=c('character','character',rep('numeric',7)))
datetime <- strptime(paste(dat$Date,dat$Time),format="%d/%m/%Y %H:%M:%S") # combine the date and time and make it date format
dat <- cbind(datetime,dat[,3:9])                    
dat2 <- subset(dat,datetime>=as.POSIXct('2007-02-01 00:00:00') & datetime<as.POSIXct('2007-02-03 00:00:00'))  # subset the two days we need

# make plot and save to PNG file
png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))
# 1st plot
with(dat2,plot(datetime,Global_active_power,type='l',ylab='Global Active Power',xlab=''))
# 2nd plot
with(dat2,plot(datetime,Voltage,type='l',ylab='Voltage'))
# 3rd plot
with(dat2,plot(datetime,Sub_metering_1,type='l',ylab='Energy sub metering',xlab=''))
with(dat2,lines(datetime,Sub_metering_2,col='red'))
with(dat2,lines(datetime,Sub_metering_3,col='blue'))
legend("topright",names(dat2)[6:8],lty=c(1,1,1),col=c('black','red','blue'),bty='n')
# 4th plot
with(dat2,plot(datetime,Global_reactive_power,type='l'))
dev.off()