plot2 <- function(){
  #Reads in the power consumption data given it's in the current working directory 
  data <- read.table("household_power_consumption.txt", sep=";", header=TRUE,
                     na.strings = "?")
  
  #data subsetted to only include power consumption from 2007-02-01 and 2007-02-02
  keep <- data[as.character(data$Date) == "1/2/2007" | as.character(data$Date) == "2/2/2007",]
  
  #Create new column of POSIXct data from existing date/time columns
  keep_2 <- cbind(strptime(paste(keep$Date,keep$Time),
                           format = "%d/%m/%Y %H:%M:%S"), keep)
  colnames(keep_2)[1] <- "Formatted_Time"
  
  png(file="plot2.png")
  with(keep_2, plot(Formatted_Time, Global_active_power, type="n",
                    ylab = "Global Active Power (kilowatts)", xlab = ""))
  with(keep_2, lines(Formatted_Time, Global_active_power, type="l"))
  dev.off()
}