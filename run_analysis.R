## Project task description
# 1. Merges the training and the test sets to create one data set. 
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## 0 Preparation: 
###     Download zipped file from the link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
###     Unzip the file just downloaded
###     Step into folder "UCI HAR Dataset" 
###     Then set current folder as working folder

## 1. Reading files into memory
### 1.1 Reading Data Package information
activitylables <- read.table("activity_labels.txt")[, 2]
features <- read.table("features.txt")[, 2]
featuresinfo <- readLines(con <- file("features_info.txt")); close(con)
readme <- readLines(con <- file("README.txt")); close(con)

### 1.2 Reading testing data  ####
subject_test <- read.table("test\\subject_test.txt")
x_test <- read.table("test\\X_test.txt")
y_test <- read.table("test\\y_test.txt")

body_acc_x_test  <- read.table("test\\Inertial Signals\\body_acc_x_test.txt") 
body_acc_y_test  <- read.table("test\\Inertial Signals\\body_acc_y_test.txt") 
body_acc_z_test  <- read.table("test\\Inertial Signals\\body_acc_z_test.txt") 
body_gyro_x_test <- read.table("test\\Inertial Signals\\body_gyro_x_test.txt")
body_gyro_y_test <- read.table("test\\Inertial Signals\\body_gyro_y_test.txt")
body_gyro_z_test <- read.table("test\\Inertial Signals\\body_gyro_z_test.txt")
total_acc_x_test <- read.table("test\\Inertial Signals\\total_acc_x_test.txt")
total_acc_y_test <- read.table("test\\Inertial Signals\\total_acc_y_test.txt")
total_acc_z_test <- read.table("test\\Inertial Signals\\total_acc_z_test.txt")

#### 1.2.1 assign column name to x_test
names(x_test) <- features

### 1.3 Reading training data ###
subject_train <- read.table("train\\subject_train.txt")
x_train <- read.table("train\\X_train.txt")
y_train <- read.table("train\\y_train.txt")

body_acc_x_train  <- read.table("train\\Inertial Signals\\body_acc_x_train.txt")
body_acc_y_train  <- read.table("train\\Inertial Signals\\body_acc_y_train.txt")
body_acc_z_train  <- read.table("train\\Inertial Signals\\body_acc_z_train.txt")
body_gyro_x_train <- read.table("train\\Inertial Signals\\body_gyro_x_train.txt")
body_gyro_y_train <- read.table("train\\Inertial Signals\\body_gyro_y_train.txt")
body_gyro_z_train <- read.table("train\\Inertial Signals\\total_acc_z_train.txt")
total_acc_x_train <- read.table("train\\Inertial Signals\\body_gyro_z_train.txt")
total_acc_y_train <- read.table("train\\Inertial Signals\\total_acc_x_train.txt")
total_acc_z_train <- read.table("train\\Inertial Signals\\total_acc_y_train.txt")

#### 1.3.1 assign column name to x_train
names(x_train) <- features

## 2. Merging the training and the test sets to create one data set. 
### 2.1 Bind corresponding subject ID to it's feature data
subject_x_test             <- cbind( subject_test, x_test            )
subject_y_test             <- cbind( subject_test, y_test            )
subject_body_acc_x_test    <- cbind( subject_test, body_acc_x_test   )
subject_body_acc_y_test    <- cbind( subject_test, body_acc_y_test   )
subject_body_acc_z_test    <- cbind( subject_test, body_acc_z_test   )
subject_body_gyro_x_test   <- cbind( subject_test, body_gyro_x_test  )
subject_body_gyro_y_test   <- cbind( subject_test, body_gyro_y_test  )
subject_body_gyro_z_test   <- cbind( subject_test, body_gyro_z_test  )
subject_total_acc_x_test   <- cbind( subject_test, total_acc_x_test  )
subject_total_acc_y_test   <- cbind( subject_test, total_acc_y_test  )
subject_total_acc_z_test   <- cbind( subject_test, total_acc_z_test  )
                              
subject_x_train            <- cbind( subject_train, x_train          )
subject_y_train            <- cbind( subject_train, y_train          )
subject_body_acc_x_train   <- cbind( subject_train, body_acc_x_train )
subject_body_acc_y_train   <- cbind( subject_train, body_acc_y_train )
subject_body_acc_z_train   <- cbind( subject_train, body_acc_z_train )
subject_body_gyro_x_train  <- cbind( subject_train, body_gyro_x_train)
subject_body_gyro_y_train  <- cbind( subject_train, body_gyro_y_train)
subject_body_gyro_z_train  <- cbind( subject_train, body_gyro_z_train)
subject_total_acc_x_train  <- cbind( subject_train, total_acc_x_train)
subject_total_acc_y_train  <- cbind( subject_train, total_acc_y_train)
subject_total_acc_z_train  <- cbind( subject_train, total_acc_z_train)

### 2.2 Merge testing and training data together, and sort it by subject_id
library(dplyr)

colnames(subject_x_test)[1]   <- "subject_id"
colnames(subject_x_train)[1]  <- "subject_id"
x <- rbind( subject_x_test, subject_x_train)
x <- arrange(x, subject_id)

colnames( subject_y_test )[1] <- "subject_id"
colnames( subject_y_train)[1] <- "subject_id"
y <- rbind( subject_y_test, subject_y_train )
y <- arrange(y, subject_id)

colnames( subject_body_acc_x_test )[1] <- "subject_id"
colnames( subject_body_acc_x_train)[1] <- "subject_id"
body_acc_x <- rbind( subject_body_acc_x_test, subject_body_acc_x_train)
body_acc_x <- arrange( body_acc_x, subject_id)

colnames(subject_body_acc_y_test)[1] <- "subject_id"
colnames(subject_body_acc_y_train)[1] <- "subject_id"
body_acc_y <- rbind( subject_body_acc_y_test, subject_body_acc_y_train)
body_acc_y <- arrange(body_acc_y, subject_id)

colnames( subject_body_acc_z_test )[1] <- "subject_id"
colnames( subject_body_acc_z_train )[1] <- "subject_id"

body_acc_z <- rbind(subject_body_acc_z_test,subject_body_acc_z_train)
body_acc_z <- arrange( body_acc_z, subject_id )

colnames( subject_body_gyro_x_test )[1] <- "subject_id"
colnames( subject_body_gyro_x_train )[1] <- "subject_id"
body_gyro_x <- rbind( subject_body_gyro_x_test, subject_body_gyro_x_train)
body_gyro_x <- arrange(body_gyro_x, subject_id)

colnames( subject_body_gyro_y_test )[1] <- "subject_id"
colnames( subject_body_gyro_y_train )[1] <- "subject_id"
body_gyro_y <- rbind( subject_body_gyro_y_test, subject_body_gyro_y_train)
body_gyro_y <- arrange( body_gyro_y, subject_id )

colnames( subject_body_gyro_z_test )[1] <- "subject_id"
colnames( subject_body_gyro_z_train )[1] <- "subject_id"
body_gyro_z <- rbind( subject_body_gyro_z_test, subject_body_gyro_z_train)
body_gyro_z <- arrange(body_gyro_z, subject_id)

colnames( subject_total_acc_x_test )[1] <- "subject_id"
colnames( subject_total_acc_x_train )[1] <- "subject_id"
total_acc_x <- rbind( subject_total_acc_x_test, subject_total_acc_x_train)
total_acc_x <- arrange( total_acc_x, subject_id)

colnames( subject_total_acc_y_test )[1] <- "subject_id"
colnames( subject_total_acc_y_train )[1] <- "subject_id"
total_acc_y <- rbind( subject_total_acc_y_test, subject_total_acc_y_train)
total_acc_y <- arrange(total_acc_y, subject_id)

colnames( subject_total_acc_z_test )[1] <- "subject_id"
colnames( subject_total_acc_z_train )[1] <- "subject_id"
total_acc_z <- rbind(subject_total_acc_z_test, subject_total_acc_z_train)
total_acc_z <- arrange( total_acc_z, subject_id)


### Now, we got one data set: 
### 	x
### 	y 
### 	body_acc_x
### 	body_acc_y
### 	body_acc_z
### 	body_gyro_x
### 	body_gyro_y
### 	body_gyro_z
### 	total_acc_x
### 	total_acc_y
### 	total_acc_z

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 2.1 extracts the measurements from features, and keep column "subject_id" as well 
features <- names(x)
extracted_features <- grepl("mean|std|subject_id", features)
## 2.2 correspondingly, only keep the extracted_features data. 
x <- x[, extracted_features]

# 3. Uses descriptive activity names to name the activities in the data set
## Use the activities its number mapping relationship, append the corresponding activities name to y. 
y[, 3] <- activitylables[ y[, 1] ]

## Bind the activity name to its corresponding measurement records. Exclude the subject_id from x, 
## because it is already exist in y
data <- cbind( y, x[,-1])

# 4. Appropriately labels the data set with descriptive variable names. 
## For the measurement names, it is already done by step: 1.2.1 and 1.3.1

## Give friendly labels name to activity columns
colnames(data)[2:3] <- c("activity_id", "activity_label")


# 5. From the data set in step 4, creates a second, independent tidy data set
#    with the average of each variable for each activity and each subject.
## split data into subsets by the combined key (subject_id, activity_id), 
## and apply statistics method mean to these subsets. 
tidy_data <- aggregate(data, by=list(data$subject_id, data$activity_id), mean)

## remove the additional column added by aggregate method.
tidy_data <- tidy_data[, 3:ncol(tidy_data)]

## reassign the active_label value which is removed by aggregate method 
tidy_data[,3] <- activitylables[ tidy_data[, 2] ]

## write the tidy data into file tidy.txt
write.table(tidy_data, "tidy.txt", sep="\t", row.name=FALSE)

# May use following code to read the tidy.txt into memory for verification
#tidy_data2 <- read.table("tidy.txt", header = TRUE)



