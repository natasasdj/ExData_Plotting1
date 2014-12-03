# read file into R
data<-read.csv2("household_power_consumption.txt",colClasses="character")
# subset required dates
dat<-data[which(data$Date=="1/2/2007"|data$Date=="2/2/2007"),]

# convert d and t into POSIXlt
d<-dat[,1]
t<-dat[,2]
dt<-paste(d,t)
pdt<-strptime(dt,"%d/%m/%Y%H:%M:%S")
# global active power
gap <- as.numeric(dat$Global_active_power)
# voltage
v <- as.numeric(dat$Voltage)
# sub metering 1, 2, 3
sm1 <- as.numeric(dat$Sub_metering_1)
sm2 <- as.numeric(dat$Sub_metering_2)
sm3 <- as.numeric(dat$Sub_metering_3)
# global reactive power
grp <- as.numeric(dat$Global_reactive_power)

# plot into png device
png("plot4.png")

par(mfrow=c(2,2),mar=c(5,4,4,2))

# date-time in days
from<- trunc(pdt[1])
to<-trunc(pdt[length(pdt)]+(60*60*24-1), "days")
at<-seq(from,to,by="day")

# global active power vs. date-time
plot(pdt,gap,xaxt="n",type="n",ann=FALSE)
lines(pdt,gap)
axis.POSIXct(1,at=at,format="%a")
title(ylab="Global Active Power")

# voltage vs. date-time
plot(pdt,v,xaxt="n",type="n",ann=FALSE)
lines(pdt,v)
axis.POSIXct(1,at=at,format="%a")
title(ylab="Voltage",xlab="datetime")

#sub metering  1, 2, 3 vs date-time
plot(pdt,sm1,xaxt="n",type="n",ann=FALSE)
axis.POSIXct(1,at=at,format="%a")
title(ylab="Energy sub metering")
lines(pdt,sm1)
lines(pdt,sm2,col="red")
lines(pdt,sm3,col="blue")
legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lwd=1)

# global reactive power
plot(pdt,grp,xaxt="n",type="n",ann=FALSE)
lines(pdt,grp)
axis.POSIXct(1,at=at,format="%a")
title(ylab="Global Reactive Power", xlab="datetime")

dev.off()