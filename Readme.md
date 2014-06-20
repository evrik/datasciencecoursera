#Support materials for Samsung data
========================================================
In Github you could find tree files:
README.md - overall description (your are reading it now)
run_analysis.R - script with code to manipulate the data
Codebook.md - description of the variables, the data, and any transformations or work that you performed to clean up the data.

## Explanation how the script works.
Script starts with creating a derictory if necessary, downloading zipfile, 
and unzipping it.


```r
if (!file.exists("data")) {
        dir.create("data")
}
fileUrl <-("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip") 
download.file(fileUrl, destfile = "./data/samsung.zip", method = "curl")
dateDownloaded <- date()
unzip("./data/samsung.zip")
```
The next step is to obtain information (labels, test & train data) from file 
using read table function. 

```r
#labels
activityLabels<-read.table("./UCI HAR Dataset/activity_labels.txt")
dataLabels<-read.table("./UCI HAR Dataset/features.txt")
subjectTest<-read.table("./UCI HAR Dataset/test/subject_test.txt")
colnames(subjectTest) <- "id"
#test data
testActivity <-read.table("./UCI HAR Dataset/test/y_test.txt")
colnames(testActivity) <- "activity"
dataTest<-read.table("./UCI HAR Dataset/test/X_test.txt")
colnames(dataTest) <- (dataLabels[,2])
Test <- data.frame(c(subjectTest, testActivity, dataTest))
#train data
subjectTrain<-read.table("./UCI HAR Dataset/train/subject_train.txt")
colnames(subjectTrain) <- "id"
dataTrain<-read.table("./UCI HAR Dataset/train/X_train.txt")
colnames(dataTrain) <- (dataLabels[,2])
trainActivity <-read.table("./UCI HAR Dataset/train/y_train.txt")
colnames(trainActivity) <- "activity"
Train <- data.frame(c(subjectTrain, trainActivity, dataTrain))
```
After that data concatenate with labels and finally merge in one data frame using rbind function. 

```r
data<-rbind(Test, Train)
```
Then, the scripts extracts only the measurements on the mean and standard deviation for each measurement, removes meanFreq measurements. 

```r
tdata <- data.frame(c(data[,1:2], data[,grep("mean()|std()", names(data), 
                                             value=TRUE)]))
tdata <-tdata[, -grep("meanFreq", colnames(tdata))]
```
The next step is to cleaning the variables names (removing extra dots) 
and renaming numbered activities by their descriptive names (walking, sitting etc) 
to create a tidy data.

```r
names(tdata) <- gsub("[.]+", ".", names(tdata))
tdata[,2]<-gsub("1", "WALKING", tdata[,2])
tdata[,2]<-gsub("2", "WALKING_UPSTAIRS", tdata[,2])
tdata[,2]<-gsub("3", "WALKING_DOWNSTAIRS", tdata[,2])
tdata[,2]<-gsub("4", "SITTING", tdata[,2])
tdata[,2]<-gsub("5", "STANDING", tdata[,2])
tdata[,2]<-gsub("6", "LAYING", tdata[,2])
```
Then using melt function, I reshaped data in long data frame to simplify further data calculations and calculate mean for each subject (id) for each activity for each variable. 

```r
meltdata <- melt(tdata,id=c("id","activity"),measure.vars=c(3:68))
countdata <- ddply(meltdata,.(id, activity, variable), summarize, mean = (mean(value)))
```
Finally, I converted data frame back to wide format and exported it in text file.

```r
tidydata <- dcast(countdata, id + activity ~ variable, value.var="mean")
write.table(tidydata, "./data/samsung.txt", sep="\t")
```

