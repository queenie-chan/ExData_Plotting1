# Plot 3:  Energy sub-metering by Day/Time

### Read and extract data
    fulldata <- read.table(file = "household_power_consumption.txt", header = T,
                           na.strings = "?",sep = ";", stringsAsFactors = F)
    # data for ony 1-2 Feb 2007
    dataRaw <- fulldata[fulldata$Date %in% c("1/2/2007","2/2/2007"),]
    data <- dataRaw
    
    # Combine Date and Time, convert to POSIXlt
    data$DateTime <- paste(data$Date, data$Time,sep = " ")
    data$DateTime <- strptime(data$DateTime, format = "%d/%m/%Y %H:%M:%S")

### Make plot, write to PNG file
png(filename = "plot3.png",width = 480, height = 480, units = "px")
    
    plot(data$DateTime, data$Sub_metering_1,type = "n", 
        xlab="",ylab="Energy sub metering")
    with(data, lines(DateTime, Sub_metering_1, col = "black"))
    with(data, lines(DateTime, Sub_metering_2, col = "red"))
    with(data, lines(DateTime, Sub_metering_3, col = "blue"))
    legend("topright",lty=1,col=c("black","red","blue"), 
        legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()