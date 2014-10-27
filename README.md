GetCleanData
============

Repo of the coursework for the _"Getting and Cleaning Data"_ course project (part of the _Coursera "Data Science Specialization"_).

## Included files/directories:

#### 'UCI HAR Dataset' directory

This is the dataset that has been unzipped after downloading from the [site prescribed](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) on the [project page](https://class.coursera.org/getdata-008/human_grading/view/courses/972586/assessments/3/submissions).

The files from this dataset that are of particular interest include:

- __'README.txt'__

		The README file included in the original dataset

- __'activity_labels.txt'__

		The activity codes (an integer in the range 1:6) and their corresponding descriptive names

- __'features.txt'__

		The column number and descriptive labels for the main data files - 'X_train.txt' & 'X_test.txt' - 561 rows & 2 columns.

- __'features_info.txt'__

		Information about what the labels contained in 'features.txt' mean.

- __'/train/subject_train.txt' & '/test/subject_test.txt'__

		Seems to be the subject id that corresponds to each row in the data files - the number of rows correspond and the values are integers in the range 1:30.

- __'/train/X_train.txt' & '/test/X_test.txt'__

		Seems to be the main data files - note that the number of columns in this file corresponds to the number of rows in 'features.txt', and I assumed that they will both be in the same order.

- __'/train/y_train.txt' & '/test/y_test.txt'__

		A list that seems to be the activity code that corresponds to each row of the data file - the number of rows match, and the values are in the range found in 'activity_labels.txt'.

The 'README.txt' file in this directory contains further information about the data set provided. The authors of this dataset have asked that anyone using it references the following publication:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. _International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012_

#### 'CodeBook.md' file

Describes the variables, the data, and any transformations or work that was performed to clean up the data.

#### 'run_analysis.R' file

This is the R script that performs the required data transformations - see below for a detailed description of how it achieves its task.

#### 'summarised_analysis.csv' file

The file that was generated to satisfy point 5 of the project requirements (see below)

## How does the 'run_analysis.R' script work?

These were the project requirements:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

It seemed logical to carry out the steps in the following order: 4->2->1->3->5.



