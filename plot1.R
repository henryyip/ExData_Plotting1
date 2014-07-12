initial <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?", stringsAsFactors=FALSE, nrows = 6)
classes <- sapply(initial, class)
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?", stringsAsFactors=FALSE, colClasses = classes, comment.char="")

# Take subset with the two specified dates: 1/2/2007 and 2/2/2007
df2day <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")

png(file = "plot1.png", width=480, height=480)

hist(df2day$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")

dev.off()