#Read data from csv with seperator ; 
powerdata<-read.csv(file='household_power_consumption.txt' ,sep=';',header=TRUE, stringsAsFactors = FALSE, na.strings= "?", strip.white=TRUE)
#convert date for filter
powerdata$Date<-as.Date(powerdata$Date, format="%d/%m/%Y")
#take only required data
powerdata<-subset(powerdata,subset = (powerdata$Date =='2007-02-01' | powerdata$Date =='2007-02-02'))
#get datetime
powerdata$datetime<-paste(powerdata$Date,powerdata$Time)
powerdata$datetime<- as.POSIXct(powerdata$datetime)
 
#plot to png device
png("plot3.png", width = 480, height = 480)
with(powerdata,plot(datetime, as.numeric(Sub_metering_1), type="l", xlab="", ylab="Energy sub metering"))
with(powerdata,lines(datetime, as.numeric(Sub_metering_2), col="red"))
with(powerdata,lines(datetime, as.numeric(Sub_metering_3), col="blue"))
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))
dev.off()

 