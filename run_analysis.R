## Read the training and the test sets, label, subject
traindata <- read.table("./UCI HAR Dataset/train/X_train.txt")
testdata <- read.table("./UCI HAR Dataset/test/X_test.txt")

## Read the training and the test label
trainlabel <- read.table("./UCI HAR Dataset/train/y_train.txt")
testlabel <- read.table("./UCI HAR Dataset/test/y_test.txt")

## Read the training and the test subject
trainsubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
testsubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")

## step1: Merges the training and the test sets to create one data set
## Merges the training and the test sets to create one data set
data <- rbind(traindata, testdata)

## Merges the training and the test label
label <- rbind(trainlabel, testlabel)

## Merges the training and the test subject
subject <- rbind(trainsubject, testsubject)

## step2: Extracts only the measurements on the mean and standard deviation for each measurement.
## Read the list of all features
features <- read.table("./UCI HAR Dataset/features.txt")
header <- features$V2

index <- grep("(mean\\(\\)|std\\(\\))", header); 
data2 <- data[index]

## step3: Uses descriptive activity names to name the activities in the data set
label <- apply(label, 2, function(y) {gsub("1", "WALKING", y)})
label <- apply(label, 2, function(y) {gsub("2", "WALKING_UPSTAIRS", y)})
label <- apply(label, 2, function(y) {gsub("3", "WALKING_DOWNSTAIRS", y)})
label <- apply(label, 2, function(y) {gsub("4", "SITTING", y)})
label <- apply(label, 2, function(y) {gsub("5", "STANDING", y)})
label <- apply(label, 2, function(y) {gsub("6", "LAYING", y)})

## step4: Appropriately labels the data set with descriptive variable names
data3 <- cbind(subject, label, data2)

## step5: creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.
index2 <- grep("(mean\\(\\)|std\\(\\))", header,  value = TRUE) 
colnames(data3) <- c("SUBJECT","ACTIVITY", index2)

library(dplyr)
data5 <- NULL
for(i in 1:30){
    data4 <- data3 %>% filter(SUBJECT==i) %>% group_by(ACTIVITY) %>% summarize_each(funs(mean))
    data5 <- rbind(data5, data4)
}

write.table(data5, file="tidymean.txt", quote=FALSE)