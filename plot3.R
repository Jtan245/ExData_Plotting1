########Assignment 1


####Downloading file
zipUrl <- "https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
#UCI source of data set - https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption

zipFile <- "UCI Household Power Data.zip"

#Download the zip file to working directory
if(!file.exists(zipFile)) {
        download.file(zipUrl, zipFile, mode = "wb")
}

#Unzip zip file to working directory
dataPath <- "UCI Household Power Data"
if(!file.exists(dataPath)) {
        unzip(zipFile)
}

#reading data into R
dir()
householdPowerData <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?",
                                 dec = ".", stringsAsFactors = F)

##########Plot 3: 
subsetPower <- householdPowerData[householdPowerData$Date %in% c("1/2/2007", "2/2/2007"), ] 
#note for character strings, need to be precise '01' and '1' etc #subsetting for just those dates per question
subsetPower$Date <- as.Date(subsetPower$Date, format = "%d/%m/%Y") #converting to date format
dateTime <- paste(subsetPower$Date, subsetPower$Time)
head(dateTime)
subsetPower$dateTime <- as.POSIXct(dateTime) #converting to the POSIXct format
head(subsetPower)


str(subsetPower)
png("plot3.png", width = 480, height = 480)
plot(subsetPower$dateTime, subsetPower$Sub_metering_1, type = 'l', ylab = "Energy submetering", xlab = "")
lines(subsetPower$dateTime, subsetPower$Sub_metering_2, type = 'l', col = "red")
lines(subsetPower$dateTime, subsetPower$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2" , "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
dev.off()