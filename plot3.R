dataset <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?") 

##Subsetting dataset from 2007-02-01 to 2007-02-02
dataset <- subset(dataset, Date %in% c("1/2/2007","2/2/2007"))

##Formating the date
dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")

##Removing NA
dataset <- dataset[complete.cases(dataset), ]

##Plot 3
with(data1, {
  plot(Sub_metering_1 ~ Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2 ~ Datetime, col='Red')
  lines(Sub_metering_3 ~ Datetime, col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Copy to PNG
dev.copy(png, file = "plot3.png", width=480, height=480)
dev.off()