##plot1.R

plot1 <- function(){

  tab5rows <- read.table("household_power_consumption.txt", header = TRUE, 
    sep = ";", nrows = 5,  na.strings = "?")
  classes <- sapply(tab5rows, class)
  data <- read.table("household_power_consumption.txt", header = FALSE,
    sep = ";", nrows = 2880,skip= 66637,  na.strings = "?", colClasses = classes)
  names(data)<-names(tab5rows)
  
  png(file = "plot1.png")
  hist(data$Global_active_power, main = "Global Active Power",
    xlab = "Global Active Power (kilowatts)", col = "Red")
  
 
  dev.off()
  
  
  
}