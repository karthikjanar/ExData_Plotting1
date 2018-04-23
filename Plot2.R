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

#plot 2
png(filename='plot1.png',width=480,height=480,units='px')
plot(strptime(paste(req_pdata$Date,req_pdata$Time),"%d/%m/%Y %H:%M:%S"),req_pdata$Global_active_power,ylab='Global Active Power (kilowatts)', xlab='', type='l')
dev.off()
