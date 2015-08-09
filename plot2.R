# Plot 2:  Global Active Power by Day/Time

### Read and extract data
    fulldata <- read.table(file = "household_power_consumption.txt", header = T,
                           na.strings = "?",sep = ";", stringsAsFactors = F)
    # data for ony 1-2 Feb 2007
    dataRaw <- fulldata[fulldata$Date %in% c("1/2/2007","2/2/2007"),]
    data <- dataRaw

    ## Combine Date and Time, convert to POSIXlt
    data$DateTime <- paste(data$Date, data$Time,sep = " ")
    data$DateTime <- strptime(data$DateTime, format = "%d/%m/%Y %H:%M:%S")

### Make plot, write to PNG file
png(filename = "plot2.png",width = 480, height = 480, units = "px")
    
    plot(data$DateTime, data$Global_active_power,type = "l",
         xlab="",ylab="Global Active Power (kilowatts)")

dev.off()