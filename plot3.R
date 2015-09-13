setwd(dir = ".")
consumption = read.table("household_power_consumption.txt",sep = ";", header = TRUE,stringsAsFactors=F)

# Change date to correct format
consumption$Date = as.Date(consumption$Date, format = "%d/%m/%Y")

# subset to use required data for assignment.
subSetData = subset(consumption, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#Combine date and time to be use for plot
datetime = paste(as.Date(subSetData$Date), subSetData$Time)
subSetData$Datetime = as.POSIXct(datetime)

# Change the sub_metering values to numeric.
subSetData$Sub_metering_1 = as.numeric(subSetData$Sub_metering_1)
subSetData$Sub_metering_2 = as.numeric(subSetData$Sub_metering_2)
subSetData$Sub_metering_3 = as.numeric(subSetData$Sub_metering_3)

#Initiate a png file for plot to be stored in. 
png(filename = "plot3.png", width = 480, height = 480)

plot(subSetData$Sub_metering_1~subSetData$Datetime,type="l", ylab = "Energy sub metering", xlab = "", col = "black")
lines(subSetData$Sub_metering_2~subSetData$Datetime,type="l", ylab = "Energy sub metering", xlab = "", col = "red")
lines(subSetData$Sub_metering_3~subSetData$Datetime,type="l", ylab = "Energy sub metering", xlab = "", col = "blue")
legend ("topright", lty=1, lwd =2, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
