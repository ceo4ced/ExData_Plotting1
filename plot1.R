plot1 <- function() {
  
  ##Import needed data from file and ignore other data
  newdata <<- read.table("household_power_consumption.txt", sep=";", header=TRUE)[66637:69516,]
  
  ##assign class to numeric for all data except first two rows
  for( i in 3:9){newdata[,i] <<- as.numeric(as.character(newdata[,i]))}

  ##Save PNG file 480 x 480
  png(filename = "plot1.png",width = 480, height = 480 )
  hist(newdata[,3], col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
  dev.off()
}

