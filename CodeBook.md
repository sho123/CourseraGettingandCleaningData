## CodeBook for Getting and Cleaning Data Course Project

R Script: run_analysis.R
Objective: creates a tidy data set from data collected from accelerometers from the Samsung Galaxy S smartphone

### RAW DATA SOURCE

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description of the data collected from the accelerometers from the Samsung Galaxy S smartphone is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


### SUBJECT AND ACTIVITY

subject: subject IDs for total of 30 subjects
activity: 6 different activities tracked:
* walking
* walking upstairs
* walking downstairs
* sitting
* standing
* laying

### VARIABLES:

Data set shows the average of each variable for each activity and each subject. Variables are named as follows:

"Mean + {Domain signal} + {Acceleration Signal} + {Tracker} + {Other Measures} + {Mean or Std} + {X, Y or Z}"

Where:

* Domain signal: Time or Freq (for frequency)
* Acceleration signal: Body or Gravity
* Tracker: Acc (for accelerometer) or Gyro (for gyroscope)
* Other Measures: where stated, denotes Jerk signals, Mag (magnitude of signal) 
* Mean or Std: denotes mean or standard deviation of variable
* XYZ: where stated, denotes 3-axial signals in X, Y and Z directions

