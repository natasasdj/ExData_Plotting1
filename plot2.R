data<-read.csv2("household_power_consumption.txt",colClasses="character")
dat<-data[which(data$Date=="1/2/2007"|data$Date=="2/2/2007"),]

d<-dat[,1]
dt<-paste(d,t)
gap <- as.numeric(dat$Global_active_power)

png("plot2.png")

plot(pdt,gap,xaxt="n",type="n",ann=FALSE)
lines(pdt,gap)
from<- trunc(pdt[1])
to<-trunc(pdt[length(pdt)]+(60*60*24-1), "days")
at<-seq(from,to,by="day")
axis.POSIXct(1,at=at,format="%a")
title(ylab="Global Active Power(kilowatts)")

dev.off()