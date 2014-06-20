#downloading file from the Web
if (!file.exists("data")) {
        dir.create("data")
}
fileUrl <-("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip") 
download.file(fileUrl, destfile = "./data/samsung.zip", method = "curl")
dateDownloaded <- date()
unzip("./data/samsung.zip")
#obtaining labels
activityLabels<-read.table("./UCI HAR Dataset/activity_labels.txt")
dataLabels<-read.table("./UCI HAR Dataset/features.txt")
#obtaining Test data and naming variables
subjectTest<-read.table("./UCI HAR Dataset/test/subject_test.txt")
colnames(subjectTest) <- "id"
testActivity <-read.table("./UCI HAR Dataset/test/y_test.txt")
colnames(testActivity) <- "activity"
dataTest<-read.table("./UCI HAR Dataset/test/X_test.txt")
colnames(dataTest) <- (dataLabels[,2])
#merging test data
Test <- data.frame(c(subjectTest, testActivity, dataTest))
#obtaining Train data and naming variables
subjectTrain<-read.table("./UCI HAR Dataset/train/subject_train.txt")
colnames(subjectTrain) <- "id"
dataTrain<-read.table("./UCI HAR Dataset/train/X_train.txt")
colnames(dataTrain) <- (dataLabels[,2])
trainActivity <-read.table("./UCI HAR Dataset/train/y_train.txt")
colnames(trainActivity) <- "activity"
#merging train data
Train <- data.frame(c(subjectTrain, trainActivity, dataTrain))
#merging data together
data<-rbind(Test, Train)
#Extracts only the measurements on the mean and standard deviation for each measurement. 
tdata <- data.frame(c(data[,1:2], data[,grep("mean()|std()", names(data), value=TRUE)]))
tdata <-tdata[, -grep("meanFreq", colnames(tdata))]
#"cleaning" variables' names 
names(tdata) <- gsub("[.]+", ".", names(tdata))
names(tdata) <- gsub("[.]", "_", names(tdata))
names(tdata) <- gsub("[_]$", "", names(tdata))
names(tdata) <- gsub("[Bb]ody[Bb]ody", "Body", names(tdata))
#Converting labels of activities into vector
tdata[,2]<-gsub("1", "WALKING", tdata[,2])
tdata[,2]<-gsub("2", "WALKING_UPSTAIRS", tdata[,2])
tdata[,2]<-gsub("3", "WALKING_DOWNSTAIRS", tdata[,2])
tdata[,2]<-gsub("4", "SITTING", tdata[,2])
tdata[,2]<-gsub("5", "STANDING", tdata[,2])
tdata[,2]<-gsub("6", "LAYING", tdata[,2])
#Reshaping data
meltdata <- melt(tdata,id=c("id","activity"),measure.vars=c(3:68))
countdata <- ddply(meltdata,.(id, activity, variable), summarize, mean = (mean(value)))
tidydata <- dcast(countdata, id + activity ~ variable, value.var="mean")
#data export
write.table(tidydata, "./data/samsung.txt", sep="\t")
