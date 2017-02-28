library(magrittr)
library(dplyr)


householddata <- read.table("household_power_consumption.txt",header = TRUE,sep = ";",stringsAsFactors = FALSE)
householddata <- householddata %>%
                    filter(Date %in% c("1/2/2007","2/2/2007"))
householddata$Date <- as.Date(householddata$Date, format = "%d/%m/%Y")
householddata <- householddata %>%
                    mutate(datetime = paste(householddata$Date,householddata$Time,sep = " "))
householddata$datetime <- as.POSIXct(householddata$datetime)

householddata$Global_active_power <- as.numeric(householddata$Global_active_power)
householddata$Global_reactive_power <- as.numeric(householddata$Global_reactive_power)
householddata$Voltage <- as.numeric(householddata$Voltage)
householddata$Global_intensity <- as.numeric(householddata$Global_intensity)
householddata$Sub_metering_1 <- as.numeric(householddata$Sub_metering_1)
householddata$Sub_metering_2 <- as.numeric(householddata$Sub_metering_2)
householddata$Sub_metering_3 <- as.numeric(householddata$Sub_metering_3)

png("plot4.png",height = 480,width = 480)
par(mfrow = c(2,2))
plot(householddata$datetime,householddata$Global_active_power,type = "l",ylab = "Global Active Power",xlab = "")
plot(householddata$datetime,householddata$Voltage,type = "l",xlab = "datetime",ylab = "Voltage")
plot(householddata$datetime,householddata$Sub_metering_1,type = "l",ylab = "Energy sub metering",xlab = "")
lines(householddata$datetime,householddata$Sub_metering_2,col = "red",type = "l")
lines(householddata$datetime,householddata$Sub_metering_3,col = "blue",type = "l")
legend("topright", col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,lwd = 3)
plot(householddata$datetime,householddata$Global_reactive_power,type = "l",ylab = "Global_reactive_power",xlab = "datetime")
dev.off()









