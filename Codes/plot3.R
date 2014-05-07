###plot3.R####
##Week 1 Assignment, Exploratory Data Analysis##

powerdata <- read.table("powerconsumption.txt", sep=";", skip=60*24*31+2, 
                        nrows=60*24*3)
cnames <-read.table("powerconsumption.txt", header= T, sep=";", nrows=2)
names(powerdata) <- names(cnames)
powerdata$Date <- as.Date(as.character(powerdata$Date), "%d/%m/%Y")
##powerdata$Time <- chron(times=powerdata$Time)

#select data from 2007-02-01 to 2007-02-02
powerdata <- powerdata[as.character(powerdata$Date) == "2007-02-01" |
     as.character(powerdata$Date) == "2007-02-02", ]

png("plot3.png", width=480, height=480)

##time series plotting
with(powerdata, plot.ts(Sub_metering_1, frame.plot=TRUE,
     axes=F, ylab="Energy sub metering", xlab=""))
lines(powerdata$Sub_metering_2, col="red")
lines(powerdata$Sub_metering_, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
     col=c("black", "red", "blue"), lty=1)
axis(2, at=c(0,10,20,30), labels=c(0,10,20,30))
axis(1, at=c(0,1440,2880), labels=c("Thu", "Fri", "Sat"))
dev.off()

