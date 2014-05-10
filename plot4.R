#This function returns a png called plot4.png
plot4<-function(){
  
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
  png("plot4.png", width = 480, height = 480, bg="transparent")
  
  # Multiplot setup
  par(mfrow = c(2, 2))
  
  # Global Active Power plot
  plot(dateTimeOfInterest, as.numeric(dataOfInterest$Global_active_power), type="l",
     ylab="Global Active Power", xlab="", cex=0.2)
  
  # Voltage plot
  plot(dateTimeOfInterest, as.numeric(dataOfInterest$Voltage), type="l",
     ylab="Voltage", xlab="datetime")
  
  # Submetering plot
  plot(dateTimeOfInterest, as.numeric(dataOfInterest$Sub_metering_1), type="l",
     ylab="Energy Submetering", xlab="")
  lines(dateTimeOfInterest, as.numeric(dataOfInterest$Sub_metering_2), type="l", col="red")
  lines(dateTimeOfInterest, as.numeric(dataOfInterest$Sub_metering_3), type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd =2.5,
       col=c("black", "red", "blue"), bty = "n")
  
  # Global Reactive Power plot
  plot(dateTimeOfInterest, as.numeric(dataOfInterest$Global_reactive_power), type="l", xlab="datetime",
     ylab="Global_reactive_power")
  
  #Close the device 
  dev.off()
  
}