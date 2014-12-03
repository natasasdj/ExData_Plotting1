# download and unzip file
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp<-tempfile()
download.file(url,temp,mode="wb")
unzip(temp, "household_power_consumption.txt")
# read file into R
data<-read.csv2("household_power_consumption.txt",colClasses="character")
dat<-data[which(data$Date=="1/2/2007"|data$Date=="2/2/2007"),]
# global active power
gap <- as.numeric(dat$Global_active_power)

# plot into png device
png("plot1.png")
breaks<- seq(0,ceiling(max(gap)/0.5)*0.5,by=0.5)
x<- as.numeric(dat$Global_active_power)
hist(x,breaks,col="red",xlab="Global Active Power(kilowatts)",
     main="Global Active Power")
dev.off()
