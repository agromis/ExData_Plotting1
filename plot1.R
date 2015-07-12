#Coursera: Exploratory Data Analysis
#Date: 7/11/2015
#Course Project 1
#Plot 1

#read data from file
load<-read.table("C:/Users/Ashley/Documents/Coursera/Exploratory Data Analysis/Course Project 1/household_power_consumption.txt", sep = ";", header=TRUE, stringsAsFactors=FALSE)
load$Global_active_power<-as.numeric(load$Global_active_power)
dates<-as.Date(load$Date, "%d/%m/%Y")
load$Date<-dates
data<-subset(load, Date=="2007-02-01" | Date=="2007-02-02")

#construct plot
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylim=c(0,1200))

#export graph
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()

#the walrus was paul