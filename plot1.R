#This function returns a png called plot1.png
plot1<-function(){
  
  #Load the data, assumes the household_power_consumption.txt file is in the
  #current working directory
  url = "household_power_consumption.txt"
  
  #Read data, n° of rows can be specifide to reduce memory load
  data <- read.table(url, header=TRUE, sep=";", stringsAsFactors =FALSE)
  
  #Create dataOfInterest subsettings the original dataset
  dataOfInterest <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
  
  #Creating an empty png
  png("plot1.png", width = 480, height = 480, bg="transparent")
  
  #Plot the Histogram using subsetted data 
  hist(as.numeric(dataOfInterest$Global_active_power), col="red",main = "Global Active Power",
       xlab="Global Active Power (kilowatts)", ylab="Frequency")
  
  #Turn off the device
  dev.off()
  
}
