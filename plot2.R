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
png(file="plot2.png",width=480,height=480)
#switching xlab names from my native language to English
Sys.setlocale("LC_TIME", "English")
#creating a plot
with(data, plot(DateTime, Global_active_power, type="l", 
     ylab = "Global Active Power (killowats)",  xlab = NA))
dev.off()

