# plot4 creates an 2x2 panel of plots. 
# It takes one argument:
#       'output' - which type of output is needed (png or other)
#
#       If output is 'png' (or blank), the plot will be written to 
#       a png file in the working directory. Otherwise, the plot  
#       will be written to the screen device.
# 
# This function will only load the data frame if it doesn't already exist
#
plot4 <- function(output = 'png') {
        source("./plot2.R")
        source("./plot3.R")
        
        # if the twodays data frame doesn't exist, go load the data
        if (!exists("twodays")) {
                source("./readPowerData.R") 
                readPowerData()
        }
        
        # if the output is png, create a new png graphics device to write the plot
        if (output == 'png') {
                png(filename = "plot4.png", width = 480, height = 480)
        }
        
        # create the panel of plots
        par(mfcol= c(2,2))
        plot2(output = "screen")
        plot3(output = "screen")
        with(twodays, plot(DateTime, Voltage, type = "l"))
        with(twodays, plot(DateTime, Global_reactive_power, type = "l"))
        
        # if the output is png, close the png graphics device we opened earlier
        if (output == 'png') {
                dev.off()
        }        
        
        # reset mfcol to default (1,1) in case the other plot functions are subsequently called
        par(mfcol= c(1,1))
}