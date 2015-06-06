#plot4.R#
##reading the data (already subsetted)
##the code to create the subset can be found in subsetting.R
feb2007 <- read.csv("feb2007.txt")
feb2007$Date<- as.Date(feb2007$Date, "%Y-%m-%d")
feb2007$datetime <- as.POSIXct(paste(feb2007$Date, feb2007$Time, sep=" "), 
                               format="%Y-%m-%d %H:%M:%S")
#Setting up de multiple plots
png(filename="plot4.png", width=480, height=480)
par(mfrow = c(2,2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(feb2007, {
        plot(datetime, Global_active_power, type="l", col="black",
             ylab = "Global Active Power", xlab = "",
             main = "")
        plot(datetime, Voltage, type="l", col="black", main = "")
        plot(datetime, Sub_metering_1, type = "l",col="black", 
             xlab="", 
             ylab="Energy sub metering", 
             main="")
        lines(datetime,Sub_metering_2, col="red")
        lines(datetime, Sub_metering_3, col="blue")
        plot(datetime, Global_reactive_power, type = "l")
})
dev.off()
