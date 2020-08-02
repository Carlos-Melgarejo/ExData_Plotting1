dataset <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?") 

##Subsetting dataset from 2007-02-01 to 2007-02-02
dataset <- subset(dataset, Date %in% c("1/2/2007","2/2/2007"))

##Formating the date
dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")

##Removing NA
dataset <- dataset[complete.cases(dataset), ]

##Plot 2
with(data1, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})

##Copy to PNG
dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off()
