# Set working directory to where the file stored
    setwd("D:/Users/tsoiwa/datasciencecoursera/ExploratoryDataAnalysis")

# Read file and choose only data for time period 1/2/2007 and 2/2/2007    
    file <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
    timereq <- subset(file, Date == "1/2/2007" | Date == "2/2/2007") 

# Combine the Date and time and convert the time data into POSIXlt
    dateConv <- strptime(paste(timereq$Date, timereq$Time, sep = " "), "%d/%m/%Y %H:%M:%S")


# Calling the basic plot function and add legend
    par(mar = c(2,4,2,4))
    plot(dateConv, as.numeric(timereq$Sub_metering_1), type = "l", main = "Energy Sub Metering by Daytime",
     xlab = "", ylab ="Energy sub metering")
    lines(dateConv, as.numeric(timereq$Sub_metering_2), type = "l", col = "red")
    lines(dateConv, as.numeric(timereq$Sub_metering_3), type = "l", col = "blue")
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd = 2, 
       col = c("black","red","blue"))

# Copy the plot to PNG device
    dev.copy(png, file = "plot3.png", width = 480, height = 480)
    dev.off()
