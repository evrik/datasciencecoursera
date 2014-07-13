#downloading file from the Web
if (!file.exists("data")) {
        dir.create("data")
}
fileUrl <-("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip") 
download.file(fileUrl, destfile = "./data/household_power_consumption.zip", method = "curl")
unzip("./data/household_power_consumption.zip")
#selecting particular data from the file and reading it
dat <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),
                  header=F, sep=';', na.strings = "?")
colnames(dat) <-names(read.table('household_power_consumption.txt', header=TRUE,
                                 sep=";",nrows=1))
#Reshaping variables
Date_Time <- paste(dat$Date,dat$Time, sep = " ")
DateTime<-strptime(Date_Time, "%d/%m/%Y %H:%M:%S")
df2<-dat[,3:9]
data <- cbind(DateTime, df2)
#creating an empty file
png(file="plot4.png",width=480,height=480, units="px")
#switching xlab names from my native language to English
Sys.setlocale("LC_TIME", "English")
#Setting parametrs for number of graphs on a device and boundries
par(mfcol = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
#1st graph
with(data, plot(DateTime, Global_active_power, type="l", ylab = "Global Active Power",
      xlab = NA))
#2nd graph
plot(data$DateTime, data$Sub_metering_1, type="l", 
     ylab = "Energy sub metering",  xlab = NA)
points (data$DateTime, data$Sub_metering_2,type = "l", col = "red")
points (data$DateTime, data$Sub_metering_3,type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),  box.lwd = 0)
#3rd graph
plot(data$DateTime, data$Voltage, type="l", 
     ylab = "Voltage",  xlab = "datetime")
#4th graph
plot(data$DateTime, data$Global_reactive_power, type="l", 
     ylab = "Global_reactive_power",  xlab = "datetime")
dev.off()