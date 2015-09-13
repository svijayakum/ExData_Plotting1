setwd(dir = ".")
consumption = read.table("household_power_consumption.txt",sep = ";", header = TRUE,stringsAsFactors=F)

# Change date to correct format
consumption$Date = as.Date(consumption$Date, format = "%d/%m/%Y")

# subset to use required data for assignment.
subSetData = subset(consumption, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#Combine date and time to be use for plot
datetime = paste(as.Date(subSetData$Date), subSetData$Time)
subSetData$Datetime = as.POSIXct(datetime)

#Change Global active power to numeric and construct plot
subSetData$Global_active_power = as.numeric(subSetData$Global_active_power)

#Initiate a png file for plot to be stored in. 
png(filename = "plot2.png",width = 480, height = 480)
plot(subSetData$Global_active_power~subSetData$Datetime,type = "l", ylab =  "Global Active Power", xlab = "" )
