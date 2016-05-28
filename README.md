<<<<<<< HEAD
## Getting and Cleaning Data Course Project

R Script: run_analysis.R
Objective: creates a tidy data set from data collected from accelerometers from the Samsung Galaxy S smartphone

=====================================================

### DATA SOURCE:

Data for the assignment:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description of the data collected from the accelerometers from the Samsung Galaxy S smartphone is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### FILES USED:

Test files:
subject_test.txt : unique IDs for 9 test subjects; 2947 observations
X_test.txt : 2947 observations of 561 variables
y_test.txt : 2947 observations consisting of the 6 activity IDs

Training files:
subject_train.txt : unique IDs for 21 test subjects; 7352 observations
X_test.txt : 7352 observations of 561 variables
y_test.txt : 7352 observations consisting of the 6 activity IDs

Other files:
features.txt : contains a list of the 561 variables
activity_labels.txt: ids for the 6 different activities

=====================================================

### WHAT SCRIPT DOES:

1. Merge training and test data sets
        a. Create complete sets for test and training data by cbinding together with subject ID file (subject) with activity ID file (y)
        b. Merge complete test and training data into one data set using rbind

2. Extract measurements on mean and standard deviation for each measurement
        a. Identify position of all mean and std dev measures in features file using grep
        b. Subset the data, include subject ID and activity ID

3. Uses descriptive activity names and appropriately label variable names
        a. Name variables in data subset using names in features file
        b. Name variables in activity labels data set
        c. Merge the two data sets using join function (dplyr package)
        
4. Create independent tidy data set with the average of each variable for each activity and each subject
        a. Use melt function to melt dataset (reshape2 package)
        b. Use dcast function to reshape data

=======
# Coursers-Data-Science-Getting-and-Cleaning-Data
>>>>>>> b0720e24f45aa9a6aa7832666e87b9dcea9c9861
