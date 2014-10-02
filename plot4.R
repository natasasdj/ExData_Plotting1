data<-read.csv2("household_power_consumption.txt",colClasses="character")
dat<-data[which(data$Date=="1/2/2007"|data$Date=="2/2/2007"),]

d<-dat[,1]
dt<-paste(d,t)
gap <- as.numeric(dat$Global_active_power)
v <- as.numeric(dat$Voltage)
sm1 <- as.numeric(dat$Sub_metering_1)
sm2 <- as.numeric(dat$Sub_metering_2)
sm3 <- as.numeric(dat$Sub_metering_3)
grp <- as.numeric(dat$Global_reactive_power)

png("plot4.png")

par(mfrow=c(2,2),mar=c(5,4,4,2))

from<- trunc(pdt[1])
to<-trunc(pdt[length(pdt)]+(60*60*24-1), "days")
at<-seq(from,to,by="day")

plot(pdt,gap,xaxt="n",type="n",ann=FALSE)
lines(pdt,gap)
axis.POSIXct(1,at=at,format="%a")
title(ylab="Global Active Power")

plot(pdt,v,xaxt="n",type="n",ann=FALSE)
lines(pdt,v)
axis.POSIXct(1,at=at,format="%a")
title(ylab="Voltage",xlab="datetime")

plot(pdt,sm1,xaxt="n",type="n",ann=FALSE)
axis.POSIXct(1,at=at,format="%a")
title(ylab="Energy sub metering")
lines(pdt,sm1)
lines(pdt,sm2,col="red")
lines(pdt,sm3,col="blue")
legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lwd=1)

plot(pdt,grp,xaxt="n",type="n",ann=FALSE)
lines(pdt,grp)
axis.POSIXct(1,at=at,format="%a")
title(ylab="Global Reactive Power", xlab="datetime")

dev.off()