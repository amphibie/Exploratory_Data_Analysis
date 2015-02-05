# Downloading File
dataset_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(dataset_url, "exdata_data_household_power_consumption.zip")
unzip("exdata_data_household_power_consumption.zip", exdir = "exdata_data_household_power_consumption")
getwd()
list.files("exdata_data_household_power_consumption")
#list.files mit dem Argument full.names=TRUE gibt den Filenamen und den Pfad dorthin vom arbeitsverzeichnis aus
file <- list.files("exdata_data_household_power_consumption", full.names=TRUE)

# Reading File in R
data<- read.table(file, sep=";", header=T, quote= "", strip.white=TRUE, stringsAsFactors = F, na.strings= "?")
dim(data)

# Subsetting the full data to obtain the data related to two days: 
data<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 
fix(data)

# creating Plot1
hist(data$Global_active_power, main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)", col = "red")

#Copy to a PNG-File
dev.copy(png, file = "plot1.png",width = 480, height = 480) ## Copy my plot to a PNG file
dev.off() ## close the PNG device