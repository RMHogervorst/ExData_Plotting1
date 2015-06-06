#Creating plot1, 
##reading the data (already subsetted)
##the code to create the subset can be found in subsetting.R
feb2007 <- read.csv("feb2007.txt")#I created a subset of the original file
#changing types:
feb2007$Date<- as.Date(feb2007$Date, "%Y-%m-%d")
feb2007$Time<- strptime(feb2007$Time, "%H:%M:%S")#Directly to strftime doesn't work, don't know why yet.
feb2007$Time<- strftime(feb2007$Time, "%H:%M:%S")
#code to create plot 1 in the screen.
hist(feb2007$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power") #verbeterdeplot met alles erin.
#write to a png
dev.copy(png,"plot1.png")
dev.off()
