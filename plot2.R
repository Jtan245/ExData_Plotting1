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

##########Plot 2: 

subsetPower <- householdPowerData[householdPowerData$Date %in% c("1/2/2007", "2/2/2007"), ] 
#note for character strings, need to be precise '01' and '1' etc #subsetting for just those dates per question
subsetPower$Date <- as.Date(subsetPower$Date, format = "%d/%m/%Y") #converting to date format
dateTime <- paste(subsetPower$Date, subsetPower$Time)
head(dateTime)
subsetPower$dateTime <- as.POSIXct(dateTime) #converting to the POSIXct format
head(subsetPower)

plot(subsetPower$Global_active_power ~ subsetPower$dateTime, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l") 
#note type 'l' (letter) not '1' (number)
png("plot2.png", width = 480, height = 480)
plot(subsetPower$Global_active_power ~ subsetPower$dateTime, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()
