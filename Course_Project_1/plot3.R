#Downloading the file
dataset_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(dataset_url, "exdata_data_household_power_consumption.zip")
unzip("exdata_data_household_power_consumption.zip", exdir = "exdata_data_household_power_consumption")
getwd()
list.files("exdata_data_household_power_consumption")
#list.files mit dem Argument full.names=TRUE gives the Filename and the path there from working directory
file <- list.files("exdata_data_household_power_consumption", full.names=TRUE)

#Reading the file in R
data<- read.table(file, sep=";", header=T, quote= "", strip.white=TRUE, stringsAsFactors = F, na.strings= "?")
dim(data)
# Subsetting the full data to obtain the data related to two days: 
data<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 
names(data)

# change the date format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
class(data$Time)
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

# creating Plot3
plot(data$DateTime, data$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

#Copy to a PNG-File
dev.copy(png, file = "plot3.png",width = 480, height = 480) ## Copy my plot to a PNG file
dev.off() ## close the PNG device