Peer Assessment 1
==============================
### Introduction

This assignment makes use of data from a personal activity monitoring device. 
This device collects data at 5 minute intervals through out the day.    
The data consists of two months of data from an anonymous individual collected during the months of October and November, 2012    
and include the number of steps taken in 5 minute intervals each day.

### Data

The data for this assignment was downloaded from [Activity monitoring data] (https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip).

The variables included in this dataset are:

* **steps:** Number of steps taking in a 5-minute interval (missing values are coded as NA)
* **date:** The date on which the measurement was taken in YYYY-MM-DD format
* **interval:** Identifier for the 5-minute interval in which measurement was taken

The dataset is stored in a comma-separated-value (CSV) file and there are a total of 17,568 observations in this dataset.

### Data preparation
Dataset was downloaded to a new directory, unziped and read using read.csv function 
```{r dataprep, echo=TRUE, cache=TRUE}
if (!file.exists("data")) {
    dir.create("data")
}
fileUrl <-("http://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip") 
download.file(fileUrl, destfile = "./data/Factivity.zip", method = "curl")
dateDownloaded <- date()
unzip("./data/Factivity.zip")
df <- read.csv("activity.csv", na.strings="NA")
```

### Q1. What is mean total number of steps taken per day?
**1. Make a histogram of the total number of steps taken each day**   
**2. Calculate and report the mean and median total number of steps taken per day**   

To answer the question the data was splitted by date first, then using sapply function number of steps was sum up for each date and mean and median were calculated.
```{r mean, echo=TRUE}
df2 <- as.vector(sapply(split(df$steps, df$date), na.rm=TRUE, sum))
meanNA<-round(mean(df2,na.rm=TRUE), digits = 0)
medianNA<-median(df2,na.rm=TRUE)
```
Here is a code to create a histogram of the total number of steps taken each day
```{r hist1, echo=TRUE, fig.height=4}
hist(df2, breaks = 10, main = "Total number of steps per day", xlab = "Number of steps")
abline(v=meanNA, col ="blue")
abline(v=medianNA, col ="red")
legend("topright", c("mean", "median"), col=c("blue", "red"), lwd=2 )
```

The mean of total number of steps taken by date is **`r meanNA`** and the median is equal **`r medianNA`**.

### Q2. What is the average daily activity pattern?
**1. Make a time series plot (i.e. type = "l") of the 5-minute interval (x-axis) and the average number of steps taken, averaged across all days (y-axis)**   
**2. Which 5-minute interval, on average across all the days in the dataset, contains the maximum number of steps?** 

To answer the question data was reshaped by intervals using split function, then for each interval mean for number of steps was calculated.
```{r interval, echo=TRUE}
df3<- data.frame(sapply(split(df$steps, df$interval), na.rm=TRUE, mean))
df3$interval <-as.numeric(rownames(df3))
rownames(df3)<-1:288
colnames(df3)<-c("stepsmean", "interval")
```
Here is a time series plot
```{r plot, echo=TRUE, fig.height=4}
plot(df3[,2], df3[,1], type = "l", main = "Total number of steps in 5-min intervals",
     xlab = "Intervals", ylab = "Total number of steps")
x<-df3[which.max(df3[,1]),]
points(x[,2], x[,1], col="red", lty=2)
text(x[,2], x[,1], labels = x[,2], cex=0.8, pos=4, col="red")
segments(0, x[,1], x[,2], x[,1], col = "red", lty="dotted", lwd = 4)
segments(x[,2], 0, x[,2], x[,1], col = "red", lty="dotted", lwd = 4)
```

 So maximum number of steps **(`r x[1]`)** lies in the interval **`r x[2]`**.   
### Q3. Imputing missing values.  
**3.1 Calculate and report the total number of missing values in the dataset (i.e. the total number of rows with NAs)**
 
```{r NAs, echo=TRUE}
sum<-sum(is.na(df))
```
The total number of missing value is **`r sum`**    

**3.2 Devise a strategy for filling in all of the missing values in the dataset.**    

An assumption, that people have repeated activity pattern depending on time of the day, was made.   So a strategy to fill missing values with a mean for that 5-minute interval, was selected.

**3.3 Create a new dataset that is equal to the original dataset but with the missing data filled in.**
```{r misvalues, echo=TRUE}
library(plyr)
impute.mean <- function(x) replace(x, is.na(x), mean(x, na.rm = TRUE))
dfwoNA <- ddply(df, ~ interval, transform, steps = impute.mean(steps))
dfwoNA <- dfwoNA[order(dfwoNA$date), ]
```

**3.4 Make a histogram of the total number of steps taken each day and Calculate and report the mean and median total number of steps taken per day. Do these values differ from the estimates from the first part of the assignment? What is the impact of imputing missing data on the estimates of the total daily number of steps?**

Code to calculate mean and median of steps taken per day using new dataset with imputing missing data.
```{r meanNA, echo=TRUE}
vecwoNA <- sapply(split(dfwoNA$steps, dfwoNA$date), sum)
mean<-mean(vecwoNA)
median<-median(vecwoNA)
p<-data.frame(mean, median)
print(p, type ="html")
```

Histogram of the total number of steps taken each day
```{r hist2, echo=TRUE,fig.height=4, fig.width=10}
par(mfcol = c(1, 2), mar = c(4, 4, 2, 1), oma = c(4, 1, 1, 1))
hist(df2, breaks = 10, main = "Total number of steps per day", xlab = "Number of steps")
abline(v=meanNA, col ="blue")
abline(v=medianNA, col ="red")

hist(vecwoNA, breaks = 10, main = "Total number of steps per day (new dataset)", xlab = "Number of steps", ylab = "")
abline(v=mean, col ="blue")
abline(v=median, col ="red")

par(fig = c(0, 1, 0, 1), oma = c(0, 0, 0, 0), mar = c(0, 0, 0, 0), new = TRUE)
plot(0, 0, type = "n", bty = "n", xaxt = "n", yaxt = "n")
legend("bottom", c("mean", "median"), xpd = TRUE, horiz = TRUE, inset = c(0, 
    0), bty = "n", lwd =2, col = c("blue", "red"), cex = 1)
```

We can see on the histograms that after imputing NAs frequency of 0-1000 steps per interval dropped.  
Mean and median are equal in new dataset.

## Q4. Are there differences in activity patterns between weekdays and weekends?
**4.1 Create a new factor variable in the dataset with two levels – “weekday” and “weekend” indicating whether a given date is a weekday or weekend day.**

New factor variable was added in four steps:  
1. Convering date column in POSIXt class
2. Adding a weekdays column to dataset
3. Replace particular names of the day with two levels: weekday and weekend
4. Change class of the variable to factor class
```{r weekday, echo=TRUE}
dfwoNA$date<-strptime(dfwoNA$date, "%Y-%m-%d")
wd<-weekdays(dfwoNA$date)
dfwd<-cbind(dfwoNA, wd)
weekdays <- NULL
day <- NULL
for(i in 1:length(dfwd$wd)) {
    day[i]<-ifelse (dfwd$wd[i] %in% c("Monday","Tuesday","Wednesday","Thursday","Friday"), 
                     'weekday', 'weekend')
    weekdays[i]<-day[i] 
}
dfwd$wd <-  factor(weekdays, levels=c('weekend', 'weekday'))
```


**4.2 Make a panel plot containing a time series plot (i.e. type = "l") of the 5-minute interval (x-axis) and the average number of steps taken, averaged across all weekday days or weekend days (y-axis).**

```{r weekgraph, echo=TRUE}
library(lattice)
cdata <- ddply(dfwd, c("wd", "interval"), summarise,
               steps = mean(steps))
xyplot(steps ~ interval | wd, data = cdata, type="l", layout = c(1, 2))
```

Based on received graphs, we could states two difference in the activity patterns between weekdays and weekend:  
1. People wake up late  
2. People move more during day on weekends  







 