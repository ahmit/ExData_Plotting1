library(magrittr)
library(dplyr)

house_data <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,stringsAsFactors = FALSE)
house_data <- house_data %>%
                filter(Date %in% c("1/2/2007","2/2/2007"))
house_data$Date <- as.Date(house_data$Date, format = "%d/%m/%Y")
house_data <- house_data %>%
                mutate(datetime = paste(house_data$Date,house_data$Time,sep = " "))
house_data$datetime <- as.POSIXct(house_data$datetime)
house_data$Sub_metering_1 <- as.numeric(house_data$Sub_metering_1)
house_data$Sub_metering_2 <- as.numeric(house_data$Sub_metering_2)
house_data$Sub_metering_3 <- as.numeric(house_data$Sub_metering_3)
png("plot3.png",width = 480,height = 480)
plot(house_data$datetime,house_data$Sub_metering_1,type = "l",ylab = "Energy sub metering",xlab = "")
lines(house_data$datetime,house_data$Sub_metering_2,col = "red",type = "l")
lines(house_data$datetime,house_data$Sub_metering_3,col = "blue",type = "l")
legend("topright",col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,lwd = 2)
dev.off()