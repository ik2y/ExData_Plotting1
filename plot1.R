

## Read data file
df <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep = ";")


## Change class column 

df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df$Time <- format(df$Time, format = "%H:%M:%S")
df$Global_active_power <- as.numeric(df$Global_active_power)
df$Global_reactive_power <- as.numeric(df$Global_reactive_power)
df$Voltage <- as.numeric(df$Voltage)
df$Global_intensity <- as.numeric(df$Global_intensity)
df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)

## Subset data based on date
filtered <-  subset(df, Date =="2007=02=01" | Date == "2007-02-02")

## plot histogram 





