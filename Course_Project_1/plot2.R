getwd()
#Das Arbeitsverzeichnis auf  "C:/Users/paul/Weiterbildung/Coursera/Data Science/Exploratory Data Analysis/Course Project/1"
#setzen !!!
dataset_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(dataset_url, "exdata_data_household_power_consumption.zip")
unzip("exdata_data_household_power_consumption.zip", exdir = "exdata_data_household_power_consumption")
getwd()
list.files("exdata_data_household_power_consumption")
#list.files mit dem Argument full.names=TRUE gibt den Filenamen und den Pfad dorthin vom arbeitsverzeichnis aus
file <- list.files("exdata_data_household_power_consumption", full.names=TRUE)

data<- read.table(file, sep=";", header=T, quote= "", strip.white=TRUE, stringsAsFactors = F, na.strings= "?")
dim(data)
# Subsetting the full data to obtain the data related to two days: 
data<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 
names(data)

# change the date format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
class(data$Time)
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

# creating Plot2
plot(data$DateTime, data$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="")
#Copy to a PNG-File
dev.copy(png, file = "plot2.png",width = 480, height = 480) ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!