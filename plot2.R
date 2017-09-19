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

# Create plot:
plot(data$datetime, data$Global_active_power, 
     type = "l", 
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

# Save plot:
dev.copy(png, file = "plot2.png", height = 480, width = 480)

# Close device:
dev.off()
