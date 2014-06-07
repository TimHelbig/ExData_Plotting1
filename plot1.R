plot1 <- function(){
  #Reads in the power consumption data given it's in the current working directory 
  data <- read.table("household_power_consumption.txt", sep=";", header=TRUE,
                        na.strings = "?")
  
  #data subsetted to only include power consumption from 2007-02-01 and 2007-02-02
  keep <- data[as.character(data$Date) == "1/2/2007" | as.character(data$Date) == "2/2/2007",]
  
  png(file="plot1.png")
  with(keep, hist(Global_active_power, col = "red",
                    xlab = "Global Active Power (kilowatts)",
                    main = "Global Active Power"))
  dev.off()
}