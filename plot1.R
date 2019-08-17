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
head(householdPowerData)
subsetPower <- householdPowerData[householdPowerData$Date %in% c("1/2/2007", "2/2/2007"), ] 
#note for character strings, need to be precise '01' and '1' etc #subsetting for just those dates per question
head(subsetPower)
str(subsetPower)
names(subsetPower)
subsetPower$Date <- as.Date(subsetPower$Date, format = "%d/%m/%Y") #converting to date format


##########Plot 1:

#Generating plot for png file device
png("plot1.png", width = 480, height = 480)
hist(subsetPower$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", col = "red")
dev.off()