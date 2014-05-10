#This function returns a png called plot3.png
plot3<-function(){
  
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
  png("plot3.png", width = 480, height = 480, bg="transparent")
  
  # Submetering plot
  plot(dateTimeOfInterest, as.numeric(dataOfInterest$Sub_metering_1), type="l",
       ylab="Energy Submetering", xlab="")
  lines(dateTimeOfInterest, as.numeric(dataOfInterest$Sub_metering_2), type="l", col="red")
  lines(dateTimeOfInterest, as.numeric(dataOfInterest$Sub_metering_3), type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd =2.5,
         col=c("black", "red", "blue"))
  
  #Close the device 
  dev.off()
  
}
