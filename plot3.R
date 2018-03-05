# plot3 creates an example line graph with three sets of data. 
# It takes one argument:
#       'output' - which type of output is needed (png or other)
#
#       If output is 'png' (or blank), the plot will be written to 
#       a png file in the working directory. Otherwise, the plot  
#       will be written to the screen device.
# 
# This function will only load the data frame if it doesn't already exist
#
plot3 <- function(output = 'png') {
        
        # if the twodays data frame doesn't exist, go load the data
        if (!exists("twodays")) {
                source("./readPowerData.R") 
                readPowerData()
        }
        
        # if the output is png, create a new png graphics device to write the plot
        if (output == 'png') {
                png(filename = "plot3.png", width = 480, height = 480)
        }
        
        
        # create the multi-data line graph
        with(twodays, plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
        with(twodays, points(DateTime, Sub_metering_2, col = "red", type = "l"))
        with(twodays, points(DateTime, Sub_metering_3, col = "blue", type = "l"))
        legend("topright", lty = 1, lwd = 2, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        # if the output is png, close the png graphics device we opened earlier
        if (output == 'png') {
                dev.off()
        }
}