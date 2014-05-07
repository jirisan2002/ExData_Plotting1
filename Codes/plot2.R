###plot2.R####
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

png("plot2.png", width=480, height=480)

##time series plotting
with(powerdata, plot.ts(Global_active_power, frame.plot=TRUE,
     axes=F, ylab="Global active power (kilowatts)"), xlab="")
axis(2, at=c(0,2,4,6), labels=c(0,2,4,6))
axis(1, at=c(0,1440,2880), labels=c("Thu", "Fri", "Sat"))
dev.off()

