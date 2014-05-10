#This function returns a png called plot2.png
plot2<-function(){
  
  #Load the data, assumes the household_power_consumption.txt file is in the
  #current working directory
  url = "household_power_consumption.txt"
  
  #Read data, n° of rows can be specifide to reduce memory load
  data <- read.table(url, header=TRUE, sep=";", stringsAsFactors =FALSE)
  
  #Create dataOfInterest and dateTimeOfInterest subsettings the original dataset
  dataOfInterest <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
  date <- as.character(as.Date(dataOfInterest$Date, "%d/%m/%Y"))
  x <- paste(date, dataOfInterest$Time)
  dateTimeOfInterest <- strptime(x, "%Y-%m-%d %H:%M:%S")
  
  #Creating an empty png
  png("plot2.png", width = 480, height = 480, bg="transparent")
  
  # Global Active Power plot
  plot(dateTimeOfInterest, as.numeric(dataOfInterest$Global_active_power), type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  
  #Close the device 
  dev.off()
  
}
