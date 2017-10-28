rm(list=ls())   # delete all old variables
dat <- read.table("household_power_consumption.txt",header=T,sep=';',stringsAsFactors = F,na.strings='?',colClasses=c('character','character',rep('numeric',7)))
datetime <- strptime(paste(dat$Date,dat$Time),format="%d/%m/%Y %H:%M:%S") # combine the date and time and make it date format
dat <- cbind(datetime,dat[,3:9])                    
dat2 <- subset(dat,datetime>=as.POSIXct('2007-02-01 00:00:00') & datetime<as.POSIXct('2007-02-03 00:00:00'))  # subset the two days we need

# make plot and save to PNG file
png("plot1.png",width=480,height=480)
hist(dat2$Global_active_power,col='red',xlab='Global Active Power (kilowatts)',ylab='Frequency',main='Global Active Power')
dev.off()