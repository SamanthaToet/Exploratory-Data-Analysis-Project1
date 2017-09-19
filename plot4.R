#### Read in and clean the data ####

# Read in the data:
data <- read.table("~samanthatoet/Desktop/Data Science/Graphing/household_power_consumption.txt",
                   header = TRUE, sep = ";", na.strings = "?")

# Convert dates to Date class:
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset rows we want:
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert dates and times and add as new column:
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")


#### Start plotting ####

# Adjust margins:
par(mfrow = c(2, 2))

# Top left graph:
plot(data$datetime, data$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power")

# Top right graph:
plot(data$datetime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# Bottom left graph:
plot(data$datetime, data$Sub_metering_1, 
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(data$datetime, data$Sub_metering_2, type = "l", col = "red")
lines(data$datetime, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.25)

# Bottom right graph:
plot(data$datetime, data$Global_reactive_power, type = "l", xlab = "datetime",
     ylab = "Global_reactive_power")

# Save plot:
dev.copy(png, file = "plot4.png", height = 480, width = 480)

# Close device:
dev.off()

