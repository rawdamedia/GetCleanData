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

#### 'summarised_analysis.txt' file

The file that was generated to satisfy point 5 of the project requirements (see below)

## How does the 'run_analysis.R' script work?

These were the project requirements:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

It seemed logical to carry out the steps in the following order: 4->2->1->3->5.

Note that the number of rows in the file 'features.txt' corresponds to the number of columns in both the '/train/X_train.txt' & '/test/X_test.txt' files, so I used 'features.txt' to generate the column names of those files.  

Given that:
1. the number of rows in '/train/subject_train.txt' & '/test/subject_test.txt' correspond to the number of rows in '/train/X_train.txt' & '/test/X_test.txt', and
2. the range of values in '/train/subject_train.txt' & '/test/subject_test.txt' were integers between 1 and 30,
it seemed reasonable to assume that these files were the corresponding subject identifiers for the relevant observation files.  I therefore combined them with the observation files to identify which observations belong to which subject.

I then used similar reasoning to match up the activity codes from '/train/y_train.txt' & '/test/y_test.txt' to the observations.

For each of the training and testing data, I only kept the columns that had "mean", "Mean" or "std" in the name.  This also included the relevant columns that were the result of Fourier analasys of the data - I decided NOT to exclude them because the instruction did not make in clear whether they should be included or not.  Note that it is easier to not use data that is included, rather than having to regenerate the data that you exclude but later decide that you really want - this was my reason for erring on the side of including these columns.

Once the data tables were appropriately labelled and assembled for training and testing separately, it was very easy to merge them into one data set using the merge() command.  I was then able to replace the activity codes with their descriptions as per the definitions contained in 'activity_labels.txt'.

Step 5 I had the most trouble with, because for some reason I couldn't get 'dplyr' to work.  I was eventually able to use the 'reshape' package to generate the appropriate summary table, and then write it out to disk using the write.table() function (using the option row.names=FALSE).

## Instructions for reading the data summary file

Assuming that the working directly is set to the directory where 'summarised_analysis.txt' resides, the summary table can be read into memory with the following command:

*read.table("summarised_analysis.txt")*

