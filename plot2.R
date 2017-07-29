# Set working directory to where the file stored
    setwd("D:/Users/tsoiwa/datasciencecoursera/ExploratoryDataAnalysis")

# Read file and choose only data for time period 1/2/2007 and 2/2/2007    
    file <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
    timereq <- subset(file, Date == "1/2/2007" | Date == "2/2/2007") 
    
# Combine the Date and time and convert the time data into POSIXlt
    dateConv <- strptime(paste(timereq$Date, timereq$Time, sep = " "), "%d/%m/%Y %H:%M:%S")


# Calling the basic plot function
    plot(dateConv, as.numeric(timereq$Global_active_power), type = "l", main = "Global Active Power by Daytime",
        xlab = "", ylab ="Global Active Power (kilowatts)")

# Copy the plot to PNG device
    dev.copy(png, file = "plot2.png", width = 480, height = 480)
    dev.off()
    