###plot1.R####
##Week 1 Assignment
##library(chron)

powerdata <- read.table("powerconsumption.txt", sep=";", skip=60*24*31+2, 
      nrows=60*24*3)
cnames <-read.table("powerconsumption.txt", header= T, sep=";", nrows=2)
names(powerdata) <- names(cnames)
powerdata$Date <- as.Date(as.character(powerdata$Date), "%d/%m/%Y")
##powerdata$Time <- chron(times=powerdata$Time)

#select data from 2007-02-01 to 2007-02-02
powerdata <- powerdata[as.character(powerdata$Date) == "2007-02-01" |
      as.character(powerdata$Date) == "2007-02-02", ]

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2)) ## plot 4 graphs, 2 in a row and 2 in a column
##time series plotting of Global active power, first plot##
with(powerdata, plot.ts(Global_active_power, frame.plot=TRUE,
      axes=F, ylab="Global active power"), xlab="")
axis(2, at=c(0,2,4,6), labels=c(0,2,4,6))
axis(1, at=c(0,1440,2880), labels=c("Thu", "Fri", "Sat"))

##time series plotting of voltage, second plot
with(powerdata, plot.ts(Voltage, frame.plot=TRUE,
      axes=F, xlab="datetime", ylab="Voltage"))
axis(2, at=c(234,236,238,240,242,244,246), labels=c("234","","238","","242","","246"))
axis(1, at=c(0,1440,2880), labels=c("Thu", "Fri", "Sat"))

##time series plotting of submeterings, third plot
with(powerdata, plot.ts(Sub_metering_1, frame.plot=TRUE,
                        axes=F, ylab="Energy sub metering", xlab=""))
lines(powerdata$Sub_metering_2, col="red")
lines(powerdata$Sub_metering_, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), bty="n", lty=1)
axis(2, at=c(0,10,20,30), labels=c(0,10,20,30))
axis(1, at=c(0,1440,2880), labels=c("Thu", "Fri", "Sat"))

## time series plotting of Global_reactive_power, fourth plot
with(powerdata, plot.ts(Global_reactive_power, frame.plot=TRUE,
      axes=F, xlab="datetime", ylab="Global_reactive_power"))
axis(2, at=c(0,.1,.2,.3,.4,.5), labels=c("0.0","0.1","0.2","0.3","0.4","0.5"))
axis(1, at=c(0,1440,2880), labels=c("Thu", "Fri", "Sat"))
dev.off()
