#Coursera: Exploratory Data Analysis
#Date: 7/11/2015
#Course Project 1
#Plot 4

#read data from file
load<-read.table("C:/Users/Ashley/Documents/Coursera/Exploratory Data Analysis/Course Project 1/household_power_consumption.txt", sep = ";", header=TRUE, stringsAsFactors=FALSE)
load$Global_active_power<-as.numeric(load$Global_active_power)
load$Sub_metering_1<-as.numeric(load$Sub_metering_1)
load$Sub_metering_2<-as.numeric(load$Sub_metering_2)
load$Sub_metering_3<-as.numeric(load$Sub_metering_3)
load$Global_reactive_power<-as.numeric(load$Global_reactive_power)
load$Voltage<-as.numeric(load$Voltage)

#set times
dt<-paste(load$Date, load$Time, sep=" ")
times<-strptime(dt, "%d/%m/%Y %H:%M:%S")
load$Time<-times

#set dates
dates<-as.Date(load$Date, "%d/%m/%Y")
load$Date<-dates

#subset
data<-subset(load, Date=="2007-02-01" | Date=="2007-02-02")

#set layout for plots
par(mfcol=c(2,2), mar=c(4,4,2,2))

#plots
with(data, {
  #plot 1
  plot(Time, Global_active_power, type="n", ylab="Global Active Power", xlab="")
  lines(Time, Global_active_power, type="l")
  
  #plot 2
  plot(Time, Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
  lines(Time, Sub_metering_1, type="l")
  lines(Time, Sub_metering_2, type="l", col="red")
  lines(Time, Sub_metering_3, type="l", col="blue")
  legend("topright", border="white", lty=c(1,1,1), col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  #plot 3
  plot(Time, Voltage, type="n", ylab="Voltage", xlab="datetime")
  lines(Time, Voltage, type="l")
  
  #plot 4
  plot(Time, Global_reactive_power, type="n", ylab="Global Reactive Power", xlab="datetime")
  lines(Time, Global_reactive_power, type="l")
})

#export graph
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()

#the walrus was paul