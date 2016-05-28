## Creates a tidy data set from data collected from the accelerometers 
## from the Samsung Galaxy S smartphone
## This run_analysis script performs the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names.
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Load all relevant data files into R
setwd("/Users/simonho/Desktop/coursera/Getting_and_Cleaning_Data/Assignment/UCI HAR Dataset")
subject_test <- read.table("./test/subject_test.txt")
X_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
subject_train <- read.table("./train/subject_train.txt")
X_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")
features <- read.table("./features.txt")
activity_labels <- read.table("activity_labels.txt")

## Create complete sets of test and training data
completetest <- cbind(X_test, y_test, subject_test)
completetrain <- cbind(X_train, y_train, subject_train)

## combine complete test and train data sets
completedata <- rbind(completetest, completetrain) 

## Identify all mean and std dev measures in features file
index_mean <- grep("mean\\()", features$V2)
index_sd <- grep("std\\()", features$V2)
features_extract <- sort(c(index_mean, index_sd))

## Extract mean and std dev measures from complete dataset (incl subject, activity IDs)
sub_data <- completedata[,c(features_extract,562,563)] 

## Tidy variable names
features_names <- features[c(features_extract),2] ## extract list of features names
features_names <- as.character(features_names)
features_names <- gsub("\\()|-","", features_names) ## remove all parentheses and dashes
features_names <- gsub("mean","Mean", features_names)
features_names <- gsub("std","Std", features_names)
features_names <- sub("^t","MeanTime", features_names)
features_names <- sub("^f","MeanFreq", features_names)

## Tidy activity names
edited_activities <- tolower(activity_labels[,2])
edited_activities <- sub("_"," ", edited_activities)
activity_labels <- mutate(activity_labels, edited_activities)

## Add variable names to data sets
names(sub_data) <- c(features_names, "activityid", "subject") ## rename all variables in data subset
names(activity_labels) <- c("activityid", "activitycap", "activity") ## rename activity labels data set

## Merge data subset with activity labels set
library(dplyr)
merged_data <- left_join(sub_data, activity_labels) ## join with activityid as common variable
merged_data$activityid <- NULL ## remove activityid column
merged_data$activitycap <- NULL ## remove activitycap column

## Create independent tidy data set with the average of each variable for each activity and each subject
library(reshape2)
moltendata <- melt(merged_data, id=c("subject", "activity"))
tidydata <- dcast(moltendata, formula = activity + subject ~ variable, mean)
write.csv(tidydata, "tidydata.csv") ## output tidydata
