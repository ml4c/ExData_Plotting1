## Set working directory (if other than current is desired)

## setwd("<path>/ExploratoryDataAnalysis")


## Download, unzip and read in full data set

temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
my_data_all <- read.csv(unz(temp, "household_power_consumption.txt"), sep = ";", dec = ".")
unlink(temp)
rm(temp)


## Create required subset of data and remove full data set to free up computer memory

my_data_all$Date <- as.Date(my_data_all$Date, format = "%d/%m/%Y")
my_data <- subset(my_data_all, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
rm(my_data_all)


## Convert variable types to prepare for analysis

my_data$Time <- strptime(paste(my_data$Date, my_data$Time), format = "%Y-%m-%d %H:%M:%S")
my_data$Global_active_power <- as.numeric(as.character(my_data$Global_active_power))
my_data$Global_reactive_power <- as.numeric(as.character(my_data$Global_reactive_power))
my_data$Voltage <- as.numeric(as.character(my_data$Voltage))
my_data$Global_intensity <- as.numeric(as.character(my_data$Global_intensity))
my_data$Sub_metering_1 <- as.numeric(as.character(my_data$Sub_metering_1))
my_data$Sub_metering_2 <- as.numeric(as.character(my_data$Sub_metering_2))
my_data$Sub_metering_3 <- as.numeric(as.character(my_data$Sub_metering_3))


## Plot 1

Sys.setlocale("LC_TIME", "English")
par(cex = 0.8)
png(file = "plot1.png", width = 504, height = 504, units = "px")
par(mfcol = c(1, 1))
with(my_data, hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red"))
dev.off()


## Remove data to free up computer memory

rm(my_data)

