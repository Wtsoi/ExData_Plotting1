# Set working directory to where the file stored
    setwd("D:/Users/tsoiwa/datasciencecoursera/ExploratoryDataAnalysis")

# Read file and choose only data for time period 1/2/2007 and 2/2/2007    
    file <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
    timereq <- subset(file, Date == "1/2/2007" | Date == "2/2/2007") 

# Combine the Date and time and convert the time data into POSIXlt
    dateConv <- strptime(paste(timereq$Date, timereq$Time, sep = " "), "%d/%m/%Y %H:%M:%S")


# Create 2 rows and 2 colums section graphs
    par(mfcol = c(2,2))
    
# Plotting the first Global Active Power graph
    plot(dateConv, as.numeric(timereq$Global_active_power), type = "l",
         xlab = "", ylab ="Global Active Power")

# Plot the second graph, the Energy sub metering    
    plot(dateConv, as.numeric(timereq$Sub_metering_1), type = "l",
     xlab = "", ylab ="Energy sub metering")
    lines(dateConv, as.numeric(timereq$Sub_metering_2), type = "l", col = "red")
    lines(dateConv, as.numeric(timereq$Sub_metering_3), type = "l", col = "blue")
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, bty = "n", 
     col = c("black","red","blue"), cex = 0.75)

# Plot the third graph, the Voltage by datetime
    plot(dateConv, as.numeric(timereq$Voltage), type = "l", xlab = "datetime", ylab = "Voltage")
    
# Plot the forth graph, the Global reative power by datetime
    plot(dateConv, as.numeric(timereq$Global_reactive_power), type = "l", xlab = "datetime", 
         ylab = "Global_reative_power")
    

# Copy the plot to PNG device
    dev.copy(png, file = "plot4.png", width = 480, height = 480)
    dev.off()
