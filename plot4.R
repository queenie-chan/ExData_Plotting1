# Plot 4 [2x2]: [1] Global Active Power by Day/Time (plot2)
#               [2] Energy sub metering by Day/Time (plot3)
#               [3] Voltage by Day/Time
#               [4] Global reactive power by Day/Time

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
png(filename = "plot4.png",width = 480, height = 480, units = "px")
    par(mfcol = c(2,2)) #Setup 2x2 plot

    #(1,1)
    plot(data$DateTime, data$Global_active_power,type = "l",
     xlab="",ylab="Global Active Power (kilowatts)")
    
    #(2,1)
    plot(data$DateTime, data$Sub_metering_1,type = "n", 
         xlab="",ylab="Energy sub metering")
    with(data, lines(DateTime, Sub_metering_1, col = "black"))
    with(data, lines(DateTime, Sub_metering_2, col = "red"))
    with(data, lines(DateTime, Sub_metering_3, col = "blue"))
    legend("topright",lty=1,col=c("black","red","blue"), 
           legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    
    #(1,2)
    plot(data$DateTime, data$Voltage, type="l",
         xlab="datetime",ylab="Voltage")
    
    #(2,2)
    plot(data$DateTime, data$Global_reactive_power, type="l",
        xlab="datetime",ylab="Global_reactive_power")

dev.off()