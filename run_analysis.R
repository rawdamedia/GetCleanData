## Submitted as part of the course project in the Coursera 'Getting and Cleaning Data' course
##
## REQUIREMENTS:
## The dataset should have been downloaded from:
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## and then unzipped to create the 'UCI HAR Dataset' directory and subdirectories.

## Activity descriptions assigned to each activity code
activLbl <- read.table("./UCI HAR Dataset/activity_labels.txt", 
                       col.names = c("code", "activity"))

## Column labels for the training data
features <- read.table("./UCI HAR Dataset/features.txt", 
                       col.names = c("column","label"))
features$label <- gsub(".*[,].*", "_", features$label)
## Only interested in the columns that deal with the mean and std
## NB- this also picks up the meanFreq() from the Fourier analysis (?need to exclude?)
subset <- c(grep(".*[mM]ean|std.*",features$label, value = F))

###################
## Training Data ##
###################

## Get the training data and label the columns
train <- read.table("./UCI HAR Dataset/train/X_train.txt", 
                    col.names = features$label)
## Get only the columns that are of interest
train <- (train[,subset])

## Read in the activity codes for each observation
activTrain <- read.table("./UCI HAR Dataset/train/y_train.txt", 
                         col.names = "Activity")

## Read in the Subject identifiers
subjTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt", 
                        col.names = "subject_ID")

## Combine into one data frame
train <- cbind(subjTrain,train,activTrain)


##################
## Testing Data ##
##################

## Get the testing data and label the columns
test <- read.table("./UCI HAR Dataset/test/X_test.txt", 
                    col.names = features$label)
## Get only the columns that are of interest
test <- (test[,subset])

## Read in the activity codes for each observation
activTest <- read.table("./UCI HAR Dataset/test/y_test.txt", 
                         col.names = "Activity")

## Read in the Subject identifiers
subjTest <- read.table("./UCI HAR Dataset/test/subject_test.txt", 
                        col.names = "subject_ID")

## Combine into one data frame
test <- cbind(subjTest,test,activTest)

#########################
## Final manipulations ##
#########################

## Merge the training and testing data
merged <- merge(train,test, all = T)

## Substitute activity names for their codes
describeActivity <- function(x){activLbl$activity[order(activLbl$code)][x]}
merged$Activity <- sapply(merged$Activity, describeActivity)
merged$subject_ID <- as.factor(merged$subject_ID)

## Generate final table
library(reshape2)
Molten <- melt(merged, id.vars = c("subject_ID", "Activity"))
answer <- dcast(subject_ID + Activity ~ variable, data = Molten, fun = mean)

## This is to the format that was requested in the project
write.table(answer, file = "summarised_analysis.txt", row.names = F)
