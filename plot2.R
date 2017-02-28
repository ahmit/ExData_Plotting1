library(dplyr)
library(magrittr)

housedata <- read.table("household_power_consumption.txt",stringsAsFactors = FALSE,sep = ";",header = TRUE)

household_data <- housedata %>%
                    filter(Date %in% c("1/2/2007","2/2/2007"))


datetime <- paste(as.Date(household_data$Date, format = "%d/%m/%Y"), household_data$Time,sep = " ")
household_data$Datetime <- as.POSIXct(datetime)
household_data$Global_active_power <- as.numeric(household_data$Global_active_power)
png("plot2.png",width = 480,height = 480)
with(household_data,plot(Global_active_power ~ Datetime,type = "l",xlab = "",ylab = "Global Active Power(kilowatts)"))
dev.off()