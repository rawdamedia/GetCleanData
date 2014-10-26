GetCleanData
============

Repo of the coursework for the _"Getting and Cleaning Data"_ course project (part of the _Coursera "Data Science Specialization"_).

## Included files/directories:

#### 'UCI HAR Dataset' directory

This is the dataset that has been unzipped after downloading from the [site prescribed](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) on the [project page](https://class.coursera.org/getdata-008/human_grading/view/courses/972586/assessments/3/submissions).

The 'README.txt' file in this directory contains further information about the data set provided. The authors of this dataset have asked that anyone using it references the following publication:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. _International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012_

#### 'CodeBook.md' file

Describes the variables, the data, and any transformations or work that was performed to clean up the data.

#### 'run_analysis.R' file

This is the R script that performs the required data transformations - see below for a more detailed description.

## How does the 'run_analysis.R' script work?

These are the steps that were carried out to satisfy the project requirements:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

