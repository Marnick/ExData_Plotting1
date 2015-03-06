plot1 <- function() {
        # function that plots the histogram of the Global Active Power               
        # for the dates 1/2/2007 and 2/2/2007
        # It saves the plotted data to file plot1.png
        # The data is provided by the UC Irvine Machine Learning Repository
        # In particular,  the "Individual household electricpower consumption
        # Data Set"
        
        # Define the classes of the columns and read the datafile
        colclass <-c("character","character",rep("numeric",7))
        data <- read.table("./project1/household_power_consumption.txt",
                header = TRUE, sep=";", colClasses=colclass, na.strings="?")

        # subset the data for 1/2/2007 and 2/2/2007
        data <- subset(data, Date=="1/2/2007"|Date=="2/2/2007")

        # plot the histogram of the Global Active Power to a png file
        png(filename="./project1/plot1.png")
        hist(data$Global_active_power, col="red", n=12, 
             main="Global Active Power", xlab="Global Active Power (kilowatts)")
        dev.off()
        }

        