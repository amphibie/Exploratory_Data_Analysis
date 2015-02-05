data<- read.table(file, sep=";", header=T, quote= "", strip.white=TRUE, stringsAsFactors = F, na.strings= "?")
dim(data)
# Subsetting the full data to obtain the data related to two days: 
data<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 
fix(data)

# creating Plot1
hist(data$Global_active_power, main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)", col = "red")

#Copy to a PNG-File
dev.copy(png, file = "plot1.png",width = 480, height = 480) ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!