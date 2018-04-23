# read the raw table
ColClass <- c(rep("character",2),rep('numeric',7))
pdata <- read.table("household_power_consumption.txt",header=TRUE,
                              sep=';',na.strings='?',colClasses=ColClass)

#limit to 2 days
req_pdata <- pdata[pdata$Date=='1/2/2007' | pdata$Date=='2/2/2007',]

# clean up the variable names and convert date/time fields
cols<-c('Date','Time','GlobalActivePower','GlobalReactivePower','Voltage','GlobalIntensity',
        'SubMetering1','SubMetering2','SubMetering3')
colnames(pdata)<-cols

#Plot 4

png(filename='plot4.png',width=480,height=480,units='px')
par(mfrow=c(2,2))


# plot data on top left (1,1)

plot(strptime(paste(req_pdata$Date,req_pdata$Time),"%d/%m/%Y %H:%M:%S"),req_pdata$Global_reactive_power,ylab='Global Active Power',xlab='',type='l')



# plot data on top right (1,2)

plot(strptime(paste(req_pdata$Date,req_pdata$Time),"%d/%m/%Y %H:%M:%S"),req_pdata$Voltage,xlab='datetime',ylab='Voltage',type='l')



# plot data on bottom left (2,1)

lncol<-c('black','red','blue')

lbls<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3')

plot(strptime(paste(req_pdata$Date,req_pdata$Time),"%d/%m/%Y %H:%M:%S"),req_pdata$Sub_metering_1,type='l',col=lncol[1],xlab='',ylab='Energy sub metering')

lines(strptime(paste(req_pdata$Date,req_pdata$Time),"%d/%m/%Y %H:%M:%S"),req_pdata$Sub_metering_2,col=lncol[2])

lines(strptime(paste(req_pdata$Date,req_pdata$Time),"%d/%m/%Y %H:%M:%S"),req_pdata$Sub_metering_3,col=lncol[3])



# plot data on bottom right (2,2)

plot(strptime(paste(req_pdata$Date,req_pdata$Time),"%d/%m/%Y %H:%M:%S"),req_pdata$Global_reactive_power,xlab='datetime',ylab='Global_reactive_power',type='l')



# close device

dev.off()
