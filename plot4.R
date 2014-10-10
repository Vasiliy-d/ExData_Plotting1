##plot4.R

plot4 <- function(){
  
  tab5rows <- read.table("household_power_consumption.txt", header = TRUE, 
                         sep = ";", nrows = 5,  na.strings = "?")
  classes <- sapply(tab5rows, class)
  data <- read.table("household_power_consumption.txt", header = FALSE,
                     sep = ";", nrows = 2880,skip= 66637,  na.strings = "?", colClasses = classes)
  names(data)<-names(tab5rows)
  
  png(file = "plot4.png")
  
  par(mfcol = c(2,2))
  
  ## first plot
  
  plot(data$Global_active_power, pch = "", type = "n", 
       ylab = "Global Active Power",xlab = "", xaxt = "n")
  lines(data$Global_active_power)
  axis(1, at = c(1, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
  
  ## second plot
  
  plot(data[, 7], type = "n", pch = "",
       ylab = "Energy sub metering",xlab = "", xaxt = "n")
  lines(data[, 7])
  lines(data[, 8], col = "red")
  lines(data[, 9], col = "blue")
  axis(1, at = c(1, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
  legend("topright", col = c("black", "red", "blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lty=c(1,1,1), lwd=c(2.5,2.5, 2.5), bty = "n")
  
  
  ## third plot
  
  plot(data$Voltage, pch = "", type = "n", 
       ylab = "Voltage",xlab = "datetime", xaxt = "n")
  lines(data$Voltage)
  axis(1, at = c(1, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
  
  
  ## forth plot
  
  plot(data$Global_reactive_power, pch = "", type = "n", 
       ylab = "Global_reactive_power",xlab = "datetime", xaxt = "n")
  lines(data$Global_reactive_power)
  axis(1, at = c(1, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
  
  
  
  dev.off()
  
  
  
}