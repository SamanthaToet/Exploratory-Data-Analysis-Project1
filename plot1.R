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

# Convert Global_active_power to numeric:
data$Global_active_power <- as.numeric(data$Global_active_power)

# Create histogram:
hist(data$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")
 
# Save graph as PNG:
png(filename = "plot1.png", width = 480, height = 480)

# Close device:
dev.off()





