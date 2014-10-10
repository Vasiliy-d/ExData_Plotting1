##plot2.R

plot2 <- function(){
  
  tab5rows <- read.table("household_power_consumption.txt", header = TRUE, 
                         sep = ";", nrows = 5,  na.strings = "?")
  classes <- sapply(tab5rows, class)
  data <- read.table("household_power_consumption.txt", header = FALSE,
                     sep = ";", nrows = 2880,skip= 66637,  na.strings = "?", colClasses = classes)
  names(data)<-names(tab5rows)
  
  png(file = "plot2.png")
  plot(data$Global_active_power, pch = "",
       ylab = "Global Active Power (kilowatts)",xlab = "", xaxt = "n")
  lines(data$Global_active_power)
  axis(1, at = c(1, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
  
  dev.off()
  
  
  
}