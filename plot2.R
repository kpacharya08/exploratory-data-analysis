#Read data from csv with seperator ; 
powerdata<-read.csv(file='household_power_consumption.txt' ,sep=';',header=TRUE, stringsAsFactors = FALSE, na.strings= "?", strip.white=TRUE)
#convert date for filter
powerdata$Date<-as.Date(powerdata$Date, format="%d/%m/%Y")
#take only required data
powerdata<-subset(powerdata,subset = (powerdata$Date =='2007-02-01' | powerdata$Date =='2007-02-02'))
#getdatetime
powerdata$datetime<-paste(powerdata$Date,powerdata$Time)
powerdata$datetime<- as.POSIXct(powerdata$datetime)
#plot to png device
png("plot2.png", width = 480, height = 480)
plot(powerdata$Global_active_power~powerdata$datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
dev.off()

 