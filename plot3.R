initial <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?", stringsAsFactors=FALSE, nrows = 6)
classes <- sapply(initial, class)
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?", stringsAsFactors=FALSE, colClasses = classes, comment.char="")

# Take subset with the two specified dates: 1/2/2007 and 2/2/2007
df2day <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")

# Create a new column which concatenates the Date and Time strings
df2day[,"Date_Time"] <- paste(df2day$Date, df2day$Time)
POSIX_Time <- strptime(df2day$Date_Time, "%d/%m/%Y %H:%M:%S")

png(file = "plot3.png", width=480, height=480)

plot(x=POSIX_Time, y=df2day$Sub_metering_1, 
     type = 'l', col = "black", 
     xlab = "", ylab = "Energy sub metering")
lines(x=POSIX_Time, y=df2day$Sub_metering_2, type = 'l', col = "red")
lines(x=POSIX_Time, y=df2day$Sub_metering_3, type = 'l', col = "blue")
legend(x="topright",
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lwd =2,  
       col = c("black", "red", "blue"))

dev.off()
