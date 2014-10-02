data<-read.csv2("household_power_consumption.txt",colClasses="character")
dat<-data[which(data$Date=="1/2/2007"|data$Date=="2/2/2007"),]

gap <- as.numeric(dat$Global_active_power)
breaks<- seq(0,ceiling(max(gap)/0.5)*0.5,by=0.5)
x<- as.numeric(dat$Global_active_power)
png("plot1.png")
hist(x,breaks,col="red",xlab="Global Active Power(kilowatts)",
     main="Global Active Power")
dev.off()