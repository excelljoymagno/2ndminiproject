##Plot 1
data1 <- read.table("./household_power_consumption.txt",sep=";",header=TRUE)

data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
data1 <- data1[data1$Date=="2007-02-02"|data1$Date=="2007-02-01",]

data1$Time <- paste(data1$Date,data1$Time,sep=" ")
data1$Time <- strptime(data1$Time, format="%Y-%m-%d %H:%M:%S")

data1$Global_active_power<-as.numeric(data1$Global_active_power)

hist(data1$Global_active_power,xlab="Global Active Power (kilowatts)",ylab="Frequency",main= "Global Active Power",col="red",width = 480, height = 480,bg = "white")

dev.copy(png,'plot1.png')
dev.off()


##Plot 2
data2 <- read.table("./household_power_consumption.txt",sep=";",header=TRUE)

data2$Date <- as.Date(data2$Date, format="%d/%m/%Y")
data2 <- data2[data2$Date=="2007-02-02"|data2$Date=="2007-02-01",]

data2$Time <- paste(data2$Date,data2$Time,sep=" ")
data2$Time <- strptime(data2$Time, format="%Y-%m-%d %H:%M:%S")

data2$Global_active_power<-as.numeric(data2$Global_active_power)

plot(data2$Time,data2$Global_active_power,ylab="Global Active Power (kilowatts)",xlab=" ",type="l",width = 480, height = 480,bg = "white")

dev.copy(png,'plot2.png')
dev.off()


##Plot 3
data3 <-read.table("./household_power_consumption.txt",sep=";",header=TRUE)

data3$Date<-as.Date(data3$Date, format="%d/%m/%Y")
data3<-data3[data3$Date=="2007-02-02"|data3$Date=="2007-02-01",]

data3$Time<-paste(data3$Date,data3$Time,sep=" ")
data3$Time<-strptime(data3$Time, format="%Y-%m-%d %H:%M:%S")

data3$Sub_metering_1<-as.numeric(data3$Sub_metering_1)
data3$Sub_metering_2<-as.numeric(data3$Sub_metering_2)
data3$Sub_metering_3<-as.numeric(data3$Sub_metering_3)

plot(data3$Time,data3$Sub_metering_1,type="l",ylab="Energy sub metering",xlab=" ",col="black")
lines(data3$Time,data3$Sub_metering_2,type="l",col="red")
lines(data3$Time,data3$Sub_metering_3,type="l",col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1)

dev.copy(png,'plot3.png')
dev.off() 


##Plot 4
data4 <- read.table("./household_power_consumption.txt",sep=";",header=TRUE)

data4$Date <- as.Date(data4$Date, format="%d/%m/%Y")
data4 <- data4[data4$Date=="2007-02-02"|data4$Date=="2007-02-01",]

data4$Time <- paste(data4$Date,data4$Time,sep=" ")
data4$Time <- strptime(data4$Time, format="%Y-%m-%d %H:%M:%S")

data4$Global_active_power<-as.numeric(data4$Global_active_power)
data4$Global_reactive_power<-as.numeric(data4$Global_reactive_power)

par(mfrow=c(2,2))

with(data4,{
  
  plot(Time, data4$Global_active_power, 
       ylab="Global Active Power (kilowatts)", xlab=" ", type="l")
  
  plot(Time, Voltage, xlab="datetime", type="l")
  
  plot(Time, Sub_metering_1, type="l", 
       ylab="Energy sub metering", xlab=" ", col="black")
  
    lines(Time, Sub_metering_2, type="l", col="red")
    lines(Time, Sub_metering_3, type="l", col="blue")
  
    legend("topright",
          col = c("black","red","blue"),
          legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
          lty = 1,
          bty = "n", xjust=1, x.intersp = 0.5, y.intersp = 0.5, cex=0.75, merge = TRUE
  )
  
  plot(Time, Global_reactive_power, 
       xlab="datetime", type="l")
})

dev.copy(png,"plot4.png",
         width = 480, 
         height = 480, )
dev.off()