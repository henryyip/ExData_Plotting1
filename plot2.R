initial <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?", stringsAsFactors=FALSE, nrows = 6)
classes <- sapply(initial, class)
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?", stringsAsFactors=FALSE, colClasses = classes, comment.char="")

# Take subset with the two specified dates: 1/2/2007 and 2/2/2007
df2day <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")

# Create a new column which concatenates the Date and Time strings
df2day[,"Date_Time"] <- paste(df2day$Date, df2day$Time)
POSIX_Time <- strptime(df2day$Date_Time, "%d/%m/%Y %H:%M:%S")

plot(x=POSIX_Time, y=df2day$Global_active_power, type = 'l', ylab = "Global Active Power (kilowatts)")

dev.copy(png, width=480, height=480, file = "plot1.png")
dev.off()