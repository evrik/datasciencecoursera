Codebook for samsung data
========================================================

### Data set information 
Initial data were collected in the experiments, that have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 


To prepare tidy data following manipulations have been done:

1. Two sets of data (training data and test data) were combined.
2. Variables names were labeled and cleaned (replacing dots with underscores).
3. Average of each variable for each activity and each subject were calculated.
4. Tidy data were exported in txt file.

Link to original data
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Variables names
Position | Code | Variable description |
--- |   ---- | ------
1   |    id |     numeric, 1-30, number is equal to volunteer's number
2 |activity| categorical
 | | WALKING
 | | WALKING_UPSTAIRS
 | | WALKING_DOWNSTAIRS        
 | | SITTING
 | | STANDING
 | | LAYING

Important info! 
Logic for variables names 

* t stands for time domain
* f stands for frequency domain
* Acc stands data for received from accelerometer
* Gyro stands data for received from gyroscope
* Body stands only for body signals
* Gravity stands for gravity signals
* Jerk stands for body linear acceleration and angular velocity that were derived 
in time
* Mag stands for magnitude of these three-dimensional signals
* XYZ stands for one of the dimentions

Position | Code | Variable description |
--- |   ---- | ------
3|	tBodyAcc_mean_X| average of means for data received from accelerometer for body only signals, axis - X
4|	tBodyAcc_mean_Y| average of means for data received from accelerometer for body only signals, axis - Y
5|	tBodyAcc_mean_Z |average of means for data received from accelerometer for body only signals, axis - Z
6|	tBodyAcc_std_X| average of standard deviations for data received from accelerometer for body only signals, axis - X
7|	tBodyAcc_std_Y| average of standard deviations for data received from accelerometer for body only signals, axis - Y
8|	tBodyAcc_std_Z| average of standard deviations for data received from accelerometer for body only signals, axis - Z
9|	tGravityAcc_mean_X| average of means for data received from accelerometer for gravity signals, axis - X
10|	tGravityAcc_mean_Y|average of means for data received from accelerometer for gravity signals, axis - Y
11|	tGravityAcc_mean_Z| average of means for data received from accelerometer for gravity signals, axis - X
12|	tGravityAcc_std_X| average of standard deviations for data received from accelerometer for gravity signals, axis - X
13|	tGravityAcc_std_Y| average of standard deviations for data received from accelerometer for gravity signals, axis - Y
14|	tGravityAcc_std_Z| average of standard deviations for data received from accelerometer for gravity signals, axis - Z
15|	tBodyAccJerk_mean_X|average of means for data received from accelerometer for body Jerk signals, axis - X
16|	tBodyAccJerk_mean_Y|average of means for data received from accelerometer for body Jerk signals, axis - Y
17|	tBodyAccJerk_mean_Z|average of means for data received from accelerometer for body Jerk signals, axis - Z
18|	tBodyAccJerk_std_X|average of standard deviations for data received from accelerometer for body Jerk signals, axis - X
19|	tBodyAccJerk_std_Y|average of standard deviations for data received from accelerometer for body Jerk signals, axis - Y
20|	tBodyAccJerk_std_Z|average of standard deviations for data received from accelerometer for body Jerk signals, axis - Z
21|	tBodyGyro_mean_X|average of means for data received from gyroscope for body only signals, axis - X
22|	tBodyGyro_mean_Y| average of means for data received from gyroscope for body only signals, axis - Y
23|	tBodyGyro_mean_Z|average of means for data received from gyroscope for body only signals, axis - Z
24|	tBodyGyro_std_X| average of standard deviation for data received from gyroscope for body only signals, axis - X
25|	tBodyGyro_std_Y|average of standard deviation for data received from gyroscope for body only signals, axis - Y
26|	tBodyGyro_std_Z|average of standard deviation for data received from gyroscope for body only signals, axis - Z
27|	tBodyGyroJerk_mean_X|average of means for data received from gyroscope, Jerk signals, axis - X
28|	tBodyGyroJerk_mean_Y|average of means for data received from gyroscope, Jerk signals, axis - Y
29|	tBodyGyroJerk_mean_Z|average of means for data received from gyroscope, Jerk signals, axis - Z
30|	tBodyGyroJerk_std_X|average of standard deviations for data received from gyroscope, Jerk signals, axis - X
31|	tBodyGyroJerk_std_Y|average of standard deviations for data received from gyroscope, Jerk signals, axis - Y
32|	tBodyGyroJerk_std_Z|average of standard deviations for data received from gyroscope, Jerk signals, axis - Z
33|	tBodyAccMag_mean| average of the means magnitude for data for data received from accelerometer for body only signals
34|	tBodyAccMag_std | average of the standard deviations of magnitude for data for data received from accelerometer for body only signals
35|	tGravityAccMag_mean| average of the means magnitude for data for data received from accelerometer for gravity signals
36|	tGravityAccMag_std| average of the standard deviations magnitude for data for data received from accelerometer for gravity signals
37|	tBodyAccJerkMag_mean|average of the means magnitude for data for data received from accelerometer for gravity Jerk signals
38|	tBodyAccJerkMag_std| average of the the standard deviations magnitude for data for data received from accelerometer for gravity Jerk signals
39|	tBodyGyroMag_mean|average of the means magnitude for data for data received from gyroscope for body only signals
40|	tBodyGyroMag_std| average of the standard deviations magnitude for data for data received from gyroscope for body only signals
41|	tBodyGyroJerkMag_mean|average of the means magnitude for data for data received from gyroscope, body Jerk signals
42|	tBodyGyroJerkMag_std|average of the standard deviations magnitude for data for data received from gyroscope, body Jerk signals
43|	fBodyAcc_mean_X| average of means of frequencies for data received from accelerometer for body only signals, axis - X
44|	fBodyAcc_mean_Y| average of means of frequencies for data received from accelerometer for body only signals, axis - Y
45|	fBodyAcc_mean_Z| average of means of frequencies for data received from accelerometer for body only signals, axis - Z
46|	fBodyAcc_std_X|average of standard deviations of frequencies for data received from accelerometer for body only signals, axis - X
47|	fBodyAcc_std_Y| average of standard deviations of frequencies for data received from accelerometer for body only signals, axis - Y
48|	fBodyAcc_std_Z| average of standard deviations of frequencies for data received from accelerometer for body only signals, axis - Z
49|	fBodyAccJerk_mean_X|average of means of frequencies for data received from accelerometer for body Jerk signals, axis - X
50|	fBodyAccJerk_mean_Y|average of means of frequencies for data received from accelerometer for body Jerk signals, axis - Y
51|	fBodyAccJerk_mean_Z|average of means of frequencies for data received from accelerometer for body Jerk signals, axis - Z
52|	fBodyAccJerk_std_X|average of standard deviations of frequencies for data received from accelerometer for body Jerk signals, axis - X
53|	fBodyAccJerk_std_Y|average of standard deviations of frequencies for data received from accelerometer for body Jerk signals, axis - Y
54|	fBodyAccJerk_std_Z|average of standard deviations of frequencies for data received from accelerometer for body Jerk signals, axis - Z
55|	fBodyGyro_mean_X|average of means of frequencies for data received from gyroscope, axis - Z
56|	fBodyGyro_mean_Y|average of means of frequencies for data received from gyroscope, axis - Y
57|	fBodyGyro_mean_Z|average of means of frequencies for data received from gyroscope, axis - Z
58|	fBodyGyro_std_X|average of standard deviations of frequencies for data received from gyroscope, axis - X
59|	fBodyGyro_std_Y|average of standard deviations of frequencies for data received from gyroscope, axis - Y
60|	fBodyGyro_std_Z|average of standard deviations of frequencies for data received from gyroscope, axis - Z
61|	fBodyAccMag_mean|average of means of magnitude for data received from accelerometer
62|	fBodyAccMag_std|average of means of magnitude for data received from accelerometer
63|     fBodyAccJerkMag_mean|average of means of magnitude for data received from accelerometer, Jerk signals
64|	fBodyAccJerkMag_std|average of standard deviations of magnitude for data received from accelerometer, Jerk signals
65|	fBodyGyroMag_mean|average of means of magnitude of body signals for data received from gyroscope
66|	fBodyGyroMag_std|average of standard deviations of magnitude of body signals for data received from gyroscope
67|	fBodyGyroJerkMag_mean|average of means of magnitude of body jerk signals for data received from gyroscope
68|	fBodyGyroJerkMag_std|average of standard deviation of magnitude of body jerk signals for data received from gyroscope

        
