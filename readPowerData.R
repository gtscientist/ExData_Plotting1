# readPowerData reads the UC Irvine "Individual household electric power consumption Data Set" (URL 
# below) andcreates a data frame for use in other functions (like plot1, plot2, etc).
#
# readPowerData takes 0 arguments
#
# readPowerData assumes the data is already unzipped, renamed to 'household_power_consumption.txt'
# and in the current working directory.
#
# performs the following transformations:
#       - uses na.strings = "?" to convert the missing data (represented by ?) is converted to NA
#       - converts the 'Date' field to the Date class
#       - subsets the dataset to only take data for two days (2007-02-01 and 2007-02-02)
#       - creates a new field called 'DateTime' as a combination of the 'Date' and 'Time' columns
#       - creates a global data frame called 'twodays' (which can then be used by other functions)
#
# Dataset URL: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip 
# 
readPowerData <- function() {
        suppressMessages(library(dplyr))
        suppressMessages(library(data.table))
        
        f <- 'household_power_consumption.txt'

        pwr <- fread(f, na.strings = "?")

        pwr <- mutate(pwr, Date = as.Date(pwr$Date, format = "%d/%m/%Y"))

        twodays <- subset(pwr, Date >= "2007-02-01" & Date <= "2007-02-02")
        twodays <- mutate(twodays, DateTime = as.POSIXct(strptime(paste(twodays$Date, twodays$Time), format = "%Y-%m-%d %H:%M:%S")))
        
        assign("twodays", twodays, envir = .GlobalEnv)
        return()
}
