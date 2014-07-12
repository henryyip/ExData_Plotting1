initial <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?", stringsAsFactors=FALSE, nrows = 6)
classes <- sapply(initial, class)
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?", stringsAsFactors=FALSE, colClasses = classes, comment.char="")

df2day <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")

hist(df2day$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png, width=480, height=480, file = "plot1.png")
dev.off()