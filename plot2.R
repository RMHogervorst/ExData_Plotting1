#Creating plot2 
##reading the data (already subsetted)
##the code to create the subset can be found in subsetting.R
feb2007 <- read.csv("feb2007.txt")
#changing types:

feb2007$Date<- as.Date(feb2007$Date, "%Y-%m-%d")
feb2007$Time<- strptime(feb2007$Time, "%H:%M:%S")#Directly to strftime doesn't work, don't know why yet.
feb2007$Time<- strftime(feb2007$Time, "%H:%M:%S")
#we need a combined date and time.
feb2007$DateTime <- as.POSIXct(paste(feb2007$Date, feb2007$Time, sep=" "), 
                            format="%Y-%m-%d %H:%M:%S")
#create a linegraph (type="l"), color black, specific labels (xlab, ylab, main)
png(filename="plot2.png", width=480, height=480)
plot(feb2007$DateTime, 
     feb2007$Global_active_power, 
     type="l",
     col="black", 
     xlab="", 
     ylab="Global Active Power (kilowatts)", 
     main="")
dev.off()
#my default language is dutch so the labels underneath the graph are do=thu, vr=fri and za=sat
