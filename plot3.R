plot3 <- function(){
  #Reads in the power consumption data given it's in the current working directory 
  data <- read.table("household_power_consumption.txt", sep=";", header=TRUE,
                     na.strings = "?")
  
  #data subsetted to only include power consumption from 2007-02-01 and 2007-02-02
  keep <- data[as.character(data$Date) == "1/2/2007" | as.character(data$Date) == "2/2/2007",]
  
  #Create new column of POSIXct data from existing date/time columns
  keep_2 <- cbind(strptime(paste(keep$Date,keep$Time),
                           format = "%d/%m/%Y %H:%M:%S"), keep)
  colnames(keep_2)[1] <- "Formatted_Time"
  
  png(file="plot3.png")
  with(keep_2, plot(Formatted_Time, Sub_metering_1, type="n",
                    ylab = "Energy sub metering", xlab = ""))
  with(keep_2, lines(Formatted_Time, Sub_metering_1, type="l"))
  with(keep_2, lines(Formatted_Time, Sub_metering_2, type="l", col="red"))
  with(keep_2, lines(Formatted_Time, Sub_metering_3, type="l", col="blue"))
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1,
         col=c("black","red","blue"))
  dev.off()
}