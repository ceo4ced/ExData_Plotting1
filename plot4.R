plot4 <- function() {
  
  ##Import data from txt file and only import needed data
  newdata <<- read.table("household_power_consumption.txt", sep=";", header=TRUE)[66637:69516,]
  
  ##Change class into numeric for all columns except the first two
  for( i in 3:9){newdata[,i] <<- as.numeric(as.character(newdata[,i]))}  
  
  ##Create Date-Time column with date by pasting Date and Tiem together
  newdata$DateTime <<- strptime(paste(newdata[,1],newdata[,2], sep=" "),format="%d/%m/%Y %H:%M:%S")
  
  ##Re-Arrange Columns
  newdata <<- newdata[,c(10,3:9)] 
  
  ##Make PNG file 480 x 480
  png(filename = "plot4.png",width = 480, height = 480 )
  par(mfrow=c(2,2))
  with(newdata,  {
       plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power")
       plot(DateTime, Voltage, type="l", xlab="datetime", ylab="Voltage")
       plot(DateTime, Sub_metering_1 , type="l", xlab="", ylab="Energy sub metering")
        lines(DateTime, Sub_metering_2, col="red")
        lines(DateTime, Sub_metering_3, col="blue")
        legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
              bty="n", lty=c(1,1), lwd=c(1,1), col=c("black","red","blue"))
       plot(DateTime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
       })
  dev.off()
}