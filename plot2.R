# clear junk variables
rm(list=ls())

# load only relavent data for speed (1/02/2007 -> 2/02/2007 [dd/mm/yyyy])
# "household_power_consumption.txt" must be in the active directory
cnames <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
            "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
            "Sub_metering_3")

pc_data <- read.table("household_power_consumption.txt", sep = ";",
                      na.strings = "?", skip = 66637, nrows = 2880, 
                      col.names = cnames, stringsAsFactors = FALSE)

Date_time <- strptime(paste(pc_data$Date, pc_data$Time), 
                      format = "%d/%m/%Y %H:%M:%S")

# Reproduce plot 2
png("plot2.png")
plot(Date_time, pc_data$Global_active_power, type = "n", xlab = "",
     ylab = "Global active power (kilowatts)")
lines(Date_time, pc_data$Global_active_power)
dev.off()