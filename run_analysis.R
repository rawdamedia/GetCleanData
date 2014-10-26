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
## Only interested in the columns that deal with the mean and std
## NB- this also picks up the meanFreq() from the Fourier analysis (?need to exclude?)
subset <- as.factor(grep("[mM]ean|std",features$label, value = T))

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

