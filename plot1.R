# Set working directory to where the file stored
    setwd("D:/Users/tsoiwa/datasciencecoursera/ExploratoryDataAnalysis")

# Read file and choose only data for time period 1/2/2007 and 2/2/2007    
    file <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
    timereq <- subset(file, Date == "1/2/2007" | Date == "2/2/2007") 

# Calling the basic graph function to plot a histogram
    hist(as.numeric(timereq$Global_active_power), col = "red", main = "Global Active Power", xlab ="Global Active Power (kilowatts)", 
         ylim = c(0,1200))

# Copy the plot to PNG device
    dev.copy(png, file = "plot1.png", width = 480, height = 480)
    dev.off()
    