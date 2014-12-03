# read file into R
data<-read.csv2("household_power_consumption.txt",colClasses="character")
# subset required dates
dat<-data[which(data$Date=="1/2/2007"|data$Date=="2/2/2007"),]

# convert d and t into POSIXlt
d<-dat[,1]
t<-dat[,2]
dt<-paste(d,t)
pdt<-strptime(dt,"%d/%m/%Y%H:%M:%S")
# Sub metering 1,2,3
sm1 <- as.numeric(dat$Sub_metering_1)
sm2 <- as.numeric(dat$Sub_metering_2)
sm3 <- as.numeric(dat$Sub_metering_3)

# plot into png device

png("plot3.png")

plot(pdt,sm1,xaxt="n",type="n",ann=FALSE)
# date-time in days
from<- trunc(pdt[1])
to<-trunc(pdt[length(pdt)]+(60*60*24-1), "days")
at<-seq(from,to,by="day")
axis.POSIXct(1,at=at,format="%a")
title(ylab="Energy sub metering")

lines(pdt,sm1)
lines(pdt,sm2,col="red")
lines(pdt,sm3,col="blue")

legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lwd=1)
dev.off()