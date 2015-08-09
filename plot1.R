# Plot 1:  Global Active Power Frequency - hist

### Read and extract data
    fulldata <- read.table(file = "household_power_consumption.txt", header = T,
                           na.strings = "?",sep = ";", stringsAsFactors = F)
    # data for ony 1-2 Feb 2007
    dataRaw <- fulldata[fulldata$Date %in% c("1/2/2007","2/2/2007"),]
    data <- dataRaw

### Make plot, write to PNG file
png(filename = "plot1.png",width = 480, height = 480, units = "px")
    
    hist(data$Global_active_power,xlab = "Global Active Power (kilowatts)",col = "red",
         main = "Global Active Power")
    
dev.off()