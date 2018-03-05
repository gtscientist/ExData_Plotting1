# plot1 creates an example histogram plot.
# It takes one argument:
#       'output' - which type of output is needed (png or other)
#
#       If output is 'png' (or blank), the plot will be written to 
#       a png file in the working directory. Otherwise, the plot  
#       will be written to the screen device.
# 
# This function will only load the data frame if it doesn't already exist
# 
plot1 <- function(output = 'png') {

        # if the twodays data frame doesn't exist, go load the data
        if (!exists("twodays")) {
                source("./readPowerData.R") 
                readPowerData()
        }
        
        # if the output is png, create a new png graphics device to write the plot
        if (output == 'png') {
                png(filename = "plot1.png", width = 480, height = 480)
        }
        
        # create the example histogram
        hist(twodays$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
        
        # if the output is png, close the png graphics device we opened earlier
        if (output == 'png') {
                dev.off()
        }
}