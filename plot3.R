#Coursera: Exploratory Data Analysis
#Date: 9/13/2015
#Course Project 1
#Plot 3

#read data from file
load<-read.table("C:/Users/Ashley/Documents/Coursera/Exploratory Data Analysis/Course Project 1/household_power_consumption.txt", sep = ";", header=TRUE, stringsAsFactors=FALSE)
load$Global_active_power<-as.numeric(load$Global_active_power)
load$Sub_metering_1<-as.numeric(load$Sub_metering_1)
load$Sub_metering_2<-as.numeric(load$Sub_metering_2)
load$Sub_metering_3<-as.numeric(load$Sub_metering_3)

#set times
dt<-paste(load$Date, load$Time, sep=" ")
times<-strptime(dt, "%d/%m/%Y %H:%M:%S")
load$Time<-times

#set dates
dates<-as.Date(load$Date, "%d/%m/%Y")
load$Date<-dates

#subset
data<-subset(load, Date=="2007-02-01" | Date=="2007-02-02")

#set device
png(file="plot3.png", width=480, height=480)

#plot
plot(data$Time, data$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
with(data, lines(Time, Sub_metering_1, type="l"))
with(data, lines(Time, Sub_metering_2, type="l", col="red"))
with(data, lines(Time, Sub_metering_3, type="l", col="blue"))
legend("topright", lty=c(1,1,1), col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()

#the walrus was paul