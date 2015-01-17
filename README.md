# Coursera's Getting and Cleaning Data  Course Project

This repository is part of the requirements for the course project of for Coursera's Getting and cleaning data MOOC.

It contains the a tidied dataset as required for the project, the R script to generate that dataset and a codebook describing the tidied dataset.

## How to reproduce

Download the [zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) file from the ["Human Activity Recognition Using Smartphones"](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) project. Extract this zip file. You should now have a directory named `UCI HAR Dataset` containing a number of text files and two subdirectories `test` and `training`.

Executing the R script [run_analysis.R](run_analysis.R) in the directory containing the `UCI HAR Dataset` produces a file [tidyFeaturesMeans.txt](tidyFeaturesMeans.txt). This file is also added to this repository. It can be read back in R using the standard `read.table` command : `read.table("tidyFeatureMeans.txt", header=TRUE)` (assuming that the file is copied to the working directory of the script running `read.table`).

## Transformations in the script

The [codebook](Codebook.md) describes the logical transformations to the data. The [run_analysis.R](run_analysis.R) is heavily commented, but the structure is as follows:

* Read test subject, activity ids and feature vectors in separate data frames
* Read training subject, activity ids and feature vectors in separate data frames
* Combine each of these 3 types of files by appending the training data rows to the test data rows
* Read the activity and feature labels
* Filter the labels so that only those with `mean()` and `stddev()` are retained
* Rename the labels to be more meaningful and R-safe
* Filter the feature vectors based on the retained labels
* Columns with the subject id and activity id of each feature vectorare added
* The activity labels are merged using the activity id so as to maintain the original row order
* The activity id is removed again as it is not required
* Each variable is averaged per subject and activity
* The result is written as [tidyFeaturesMeans.txt](tidyFeaturesMeans.txt)
