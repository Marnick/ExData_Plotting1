plot3 <- function() {
        # function that plots submetering 1,2,3 the dates 1/2/2007 and 2/2/2007
        # It saves the plotted data to file plot3.png
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

        # Open png file
        png(filename="./project1/plot3.png")
        # set local language to English so weekdays are in English
        Sys.setlocale("LC_TIME", "English")
        # plot the submetering data to the png file
        plot(data$DateTime, data$Sub_metering_1, type="l", main="", xlab="",
             ylab="Energy sub metering")
        lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
        lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
        legend("topright", lty=1, lwd=1, col= c("black", "red","blue"),
               c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        # close the png file
        dev.off()
        }

        