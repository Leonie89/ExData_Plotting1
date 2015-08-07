# loading dataset into R
data <- read.table(paste(getwd(), "household_power_consumption.txt", sep="/"), header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 

# check dimension of dataset
dim(data)
# 2075259       9

# get data from the dates 2007-02-01 and 2007-02-02
data_subset <-  data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# check dimension of subset 
dim(data_subset)
# 2880    9

# check column names of subset
colnames(data_subset)
# [1] "Date"                  "Time"                  "Global_active_power"   "Global_reactive_power" "Voltage"              
# [6] "Global_intensity"      "Sub_metering_1"        "Sub_metering_2"        "Sub_metering_3"  

# display structure of subset
str(data_subset)
# 'data.frame':  2880 obs. of  9 variables:
# $ Date                 : chr  "1/2/2007" "1/2/2007" "1/2/2007" "1/2/2007" ...
# $ Time                 : chr  "00:00:00" "00:01:00" "00:02:00" "00:03:00" ...
# $ Global_active_power  : chr  "0.326" "0.326" "0.324" "0.324" ...
# $ Global_reactive_power: chr  "0.128" "0.130" "0.132" "0.134" ...
# $ Voltage              : chr  "243.150" "243.320" "243.510" "243.900" ...
# $ Global_intensity     : chr  "1.400" "1.400" "1.400" "1.400" ...
# $ Sub_metering_1       : chr  "0.000" "0.000" "0.000" "0.000" ...
# $ Sub_metering_2       : chr  "0.000" "0.000" "0.000" "0.000" ...
# $ Sub_metering_3       : num  0 0 0 0 0 0 0 0 0 0 ...

# convert format to numeric
Global_active_power <- as.numeric(data_subset$Global_active_power)

# save plots as png
png("plot1.png", width=480, height=480)

# plot 
hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# close current graphic window
dev.off()
