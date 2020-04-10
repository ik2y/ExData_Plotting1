plot3 <- function() {

## Read data file
df2 <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep = ";")

## Merged Date and Time
merged <- strptime(paste(df2$Date, df2$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
df2 <- cbind(df2, merged)


## Change class column 

df2$Date <- as.Date(df2$Date, format = "%d/%m/%Y")
df2$Time <- format(df2$Time, format = "%H:%M:%S")
df2$Global_active_power <- as.numeric(df2$Global_active_power)
df2$Global_reactive_power <- as.numeric(df2$Global_reactive_power)
df2$Voltage <- as.numeric(df2$Voltage)
df2$Global_intensity <- as.numeric(df2$Global_intensity)
df2$Sub_metering_1 <- as.numeric(df2$Sub_metering_1)
df2$Sub_metering_2 <- as.numeric(df2$Sub_metering_2)
df2$Sub_metering_3 <- as.numeric(df2$Sub_metering_3)

## Subset data based on date
filtered <-  subset(df2, Date == "2007-02-01" | Date == "2007-02-02")

## plot histogram 
png("plot3.png", width = 480, height = 480)
with(filtered, plot(merged, Sub_metering_1, type="l", xlab="Day", ylab = "Energy sub metering"))
lines(filtered$merged, filtered$Sub_metering_2, type = "l", col = "red")
lines(filtered$merged, filtered$Sub_metering_3, type = "l", col = "blue")
legend(c("topright"), c("Sub_,etering_1", "Sub-metering_2", "Sub_metering_3"), lty = 1, lwd = 1, col = c("black", "red", "blue"))
dev.off()

}