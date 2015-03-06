plot2 <- function() {
        # function that plots the the Global Active Power               
        # for the dates 1/2/2007 and 2/2/2007
        # It saves the plotted data to file plot2.png
        # The data is provided by the UC Irvine Machine Learning Repository
        # In particular,  the "Individual household electricpower consumption
        # Data Set"
        
        # Define the classes of the columns and read the datafile
        colclass <-c("character","character",rep("numeric",7))
        data <- read.table("./project1/household_power_consumption.txt",
                header = TRUE, sep=";", colClasses=colclass, na.strings="?")
        # subset the data for 1/2/2007 and 2/2/2007
        data <- subset(data, Date=="1/2/2007"|Date=="2/2/2007")

        # create a POSIXlt from the date and time column
        data$DateTime <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")

        # plot the Global Active Power to a png file
        png(filename="./project1/plot2.png")
        plot(data$DateTime,data$Global_active_power, type="l", main="", 
             xlab ="", ylab="Global Active Power")
        dev.off()
        }

        