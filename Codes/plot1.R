###plot1.R####
##Week 1 Assignment

powerdata <- read.table("powerconsumption.txt", sep=";", skip=60*24*31+2, 
     nrows=60*24*3)
cnames <-read.table("powerconsumption.txt", header= T, sep=";", nrows=2)
names(powerdata) <- names(cnames)
powerdata$Date <- as.Date(as.character(powerdata$Date), "%d/%m/%Y")
##powerdata$Time <- chron(times=powerdata$Time)

#select data from 2007-02-01 to 2007-02-02
powerdata <- powerdata[as.character(powerdata$Date) == "2007-02-01" |
     as.character(powerdata$Date) == "2007-02-02", ]

png("plot1.png", width=480, height=480)
with(powerdata, hist(Global_active_power, col="red", 
     main="Global Active Power", xlab="Global active power(kilowatts)"))
dev.off()


