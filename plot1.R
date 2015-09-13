setwd(dir = ".")
consumption = read.table("household_power_consumption.txt",sep = ";", header = TRUE,stringsAsFactors=F)

# Change date to correct format
consumption$Date = as.Date(consumption$Date, format = "%d/%m/%Y") 

# subset to use required data for assignment.
subSetData = subset(consumption, subset = (Date >= "2007-02-01" & Date <= "2007-02-02")) 

# Plot 1
subSetData$Global_active_power = as.numeric(subSetData$Global_active_power)

#Initiate a png file for plot to be stored in. 
png(filename = "plot1.png",width = 480, height = 480)
hist(subSetData$Global_active_power, col = "red", xlab = "Global Active Power (Kilowatts)", 
     main = "Global Active Power", cex.lab=0.8, cex.axis=0.8)
