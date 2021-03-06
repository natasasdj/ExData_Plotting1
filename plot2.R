# read data into R
data<-read.csv2("household_power_consumption.txt",colClasses="character")
# subset required dates
dat<-data[which(data$Date=="1/2/2007"|data$Date=="2/2/2007"),]

# convert d and t into POSIXlt
d<-dat[,1]
t<-dat[,2]
dt<-paste(d,t)
pdt<-strptime(dt,"%d/%m/%Y%H:%M:%S")
# Global active power
gap <- as.numeric(dat$Global_active_power)

# plot into png device
png("plot2.png")

plot(pdt,gap,xaxt="n",type="n",ann=FALSE)
lines(pdt,gap)
from<- trunc(pdt[1])
to<-trunc(pdt[length(pdt)]+(60*60*24-1), "days")
at<-seq(from,to,by="day")
axis.POSIXct(1,at=at,format="%a")
title(ylab="Global Active Power(kilowatts)")

dev.off()
