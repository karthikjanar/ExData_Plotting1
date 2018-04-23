# read the raw table and limit to 2 days
ColClass <- c(rep("character",2),rep('numeric',7))
pdata <- read.table("household_power_consumption.txt",header=TRUE,
                              sep=';',na.strings='?',colClasses=ColClass)

req_pdata <- pdata[pdata$Date=='1/2/2007' | pdata$Date=='2/2/2007',]

# clean up the variable names and convert date/time fields
cols<-c('Date','Time','GlobalActivePower','GlobalReactivePower','Voltage','GlobalIntensity',
        'SubMetering1','SubMetering2','SubMetering3')
colnames(pdata)<-cols

# plot 1
png(filename='plot1.png',width=480,height=480,units='px')
hist(req_pdata$Global_active_power,main='Global Active Power',xlab='Global Active Power (kilowatts)',col='red')
x<-dev.off()
