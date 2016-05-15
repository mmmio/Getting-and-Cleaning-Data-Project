#Getting and Cleaning Data Project

## run_analysis.R

This script has following 5 steps.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

After running this script, the file "tidymean.txt" will be created.

## Notes

*  Original source data is from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
*  Before you run the script, you should download and unzip original source data in the current directory.  
*  The script reqires dplyr package.