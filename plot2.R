#Coursera: Exploratory Data Analysis
#Date: 9/13/2015
#Course Project 1
#Plot 2

#read data from file
load<-read.table("C:/Users/Ashley/Documents/Coursera/Exploratory Data Analysis/Course Project 1/household_power_consumption.txt", sep = ";", header=TRUE, stringsAsFactors=FALSE)
load$Global_active_power<-as.numeric(load$Global_active_power)

#set times
dt<-paste(load$Date, load$Time, sep=" ")
times<-strptime(dt, "%d/%m/%Y %H:%M:%S")
load$Time<-times

#set dates
dates<-as.Date(load$Date, "%d/%m/%Y")
load$Date<-dates

#subset
data<-subset(load, Date=="2007-02-01" | Date=="2007-02-02")

#plot
plot(data$Time, data$Global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab="")
lines(data$Time, data$Global_active_power, type="l")

#export graph
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()

#the walrus was paul