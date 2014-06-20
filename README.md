Here is a description of the script in file run_analysis.r

Script starts with creating a derictory if necessary, downloading zipfile, and unzip it.
The next step is to obtain information (labels, test & train data) from file using read.table function.
After that data concatenate with labels and finally merge in one data frame using rbind function. 
Then, I  extracted only the measurements on the mean and standard deviation for each measurement 
and remove meanFreq measurements, and remove dots from varibale names to create tidy data.
The next step is to rename numbered activities by their descriptive names (walking, sitting etc)
Then using melt function, I reshaped data in long data frame to simplify further data calculations 
and calculate mean for each subject (id) for each activity for each variable.
Finally, I converted data frame back to wide format and exported it in text file.

