# Getting and cleaning data

## Course Project

This repository is holding my work for the course project for the "Getting and Cleaning Data" Course. 

### Data source

The source data （raw data) is got from following like:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Project task

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
 
### File list

There four files in this repository, they are
1. README.md: contains the basic information about the repository
2. run_analysis.R:  is the script reading all the raw data into memory and tidy them up. 
3. tidy.txt: is the file contains the tidy data. 
4. CodeBook.md: the description for tidy data. 


### How to execute run_analysis.R script

Before you execute the run_analysis.R script, you need to download the raw data from the data source link given above, then unzip the file, then step into the file folder: UCI HAR Dataset which is created during unzipping raw data file. By the mean time, set it as your current working directory for you R Studio or other R executing enviorment. Then in the R executing enviorment, source the script:

<pre><code>
source('C:/Users/i305271/dev/src/git-hub/getandcleandata/run_analysis.R', echo=TRUE)
</code></pre>

After a while, tidy.txt file would be generated in the current working folder. It should be the same as tidy.txt file in the current repository. 

### What does the run_analysis.R script do?
0. At the beginning of the script, it described the project task and the necessery preparations. Here are the preparation steps:
    1. User needs to download the raw data from the given URL 
    2. Unzip the file just downloaded, will create a folder named as : UCI HAR Dataset
    3. Step into folder "UCI HAR Dataset"
    4. The set current folder as working folder. 
    
1. Reading files into memory

    1.1. Reading data package information
    1.2. Reading testing data
      1.2.1. Assign column name to x_test data
    1.3. Reading training data
      1.3.1. Assign column name to x_train
2. Merging training and testing data and create one data set
    2.1. Bind corresponding subject ID to it's feature data
    2.2. Merge testing and training data together, and sort it by subject_id
       2.2.1. load package dplyr, because we need arrange() to sort data

Now we have one merged data set:
. x
. y
. body_acc_x
. body_acc_y
. body_acc_z
. body_gyro_x
. body_gyro_y
. body_gyro_z
. total_acc_x
. total_acc_y
. total_acc_z


 
