# Code book for the cleaned version of the UCI "Human Activity Recognition Using Smartphones" dataset

## Source

The source data was compiled by

> Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. 
> Smartlab - Non Linear Complex Systems Laboratory 
> DITEN - UniversitÃ  degli Studi di Genova, Genoa I-16145, Italy. 
> activityrecognition '@' smartlab.ws 
> www.smartlab.ws 

It is distributed at the (UCI Machine Learning Repository)[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones] as (UCI HAR Dataset.zip)[http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip]

The original dataset contains several files: training and test files containing feature vectors and separate subject and activity files describing the feature vectors.

More detailled information can be found in the `README.txt` file in the zip archive.

## Transformations

The training and testing feature vectors have been combined into one. Information about the subjects and the activity associated with each feature vector has been merged.

Labels have been modified to make their meaning clearer and easier to use with R.

From the original measurements only the ones concerning means and standard deviations have been retained.

Finally, per activity and per subject the mean of all, retained, measurements has been calculated. The result can be found in (`tidyFeatureMeans.txt`)[tidyFeatureMeans.txt].

## The variables

There are two set of variables: those describe the context and those that are means of measurements (or estimations).

### Context variables

 * Subject_Id: the subject that generated the values in the measurement columns
 * Activity: the activity the subject reported for the values in the measurement columns

### Measurements

These are all means of measurements belonging to one subject performing one activity. For the low-level detail you are invited to read the file `features_info.txt`. It describes data windows, sampling intervals and filters applied to raw sensor data to come up with the source data for the UCI dataset.

All measurement labels follow a fixed pattern: {SignalName} _ {Component} _ {Domain} _ {Stat}.
 * SignalName: the estimated signal
 * Component: `X`, `Y`, `Z` for the signal along the 3 spatial orthogonal axes (presumably as defined by the API of the smartphone used for the measurments) and `Magnitude` for the magnitude of the signal according to the L2 norm.
 * Domain: `Time` or `Frequency` for signals in the time, respectively the frequency domain. The frequency domain signal have been obtained by an FFT.
 * Stat: `Mean` or `StdDev` for respectively the mean or the standard deviation in the raw source data windows.

All source measurements were normalised in the range [-1, 1] and are thus unitless.

#### BodyAccJerk

Measurements describing body linear acceleration. The high-frequency signal captured by the accelerometer.

 * `BodyAcc_Magnitude_Frequency_Mean` 
 * `BodyAcc_Magnitude_Frequency_StdDev` 
 * `BodyAcc_Magnitude_Time_Mean` 
 * `BodyAcc_Magnitude_Time_StdDev` 
 * `BodyAcc_X_Frequency_Mean` 
 * `BodyAcc_X_Frequency_StdDev` 
 * `BodyAcc_X_Time_Mean` 
 * `BodyAcc_X_Time_StdDev` 
 * `BodyAcc_Y_Frequency_Mean` 
 * `BodyAcc_Y_Frequency_StdDev` 
 * `BodyAcc_Y_Time_Mean` 
 * `BodyAcc_Y_Time_StdDev` 
 * `BodyAcc_Z_Frequency_Mean` 
 * `BodyAcc_Z_Frequency_StdDev` 
 * `BodyAcc_Z_Time_Mean` 
 * `BodyAcc_Z_Time_StdDev`

#### BodyGyroJerk

Measurements describing body angular velocity. The denoised gyroscope signal.

 * `BodyGyro_Magnitude_Frequency_Mean` 
 * `BodyGyro_Magnitude_Frequency_StdDev` 
 * `BodyGyro_Magnitude_Time_Mean` 
 * `BodyGyro_Magnitude_Time_StdDev` 
 * `BodyGyro_X_Frequency_Mean` 
 * `BodyGyro_X_Frequency_StdDev` 
 * `BodyGyro_X_Time_Mean` 
 * `BodyGyro_X_Time_StdDev` 
 * `BodyGyro_Y_Frequency_Mean` 
 * `BodyGyro_Y_Frequency_StdDev` 
 * `BodyGyro_Y_Time_Mean` 
 * `BodyGyro_Y_Time_StdDev` 
 * `BodyGyro_Z_Frequency_Mean` 
 * `BodyGyro_Z_Frequency_StdDev` 
 * `BodyGyro_Z_Time_Mean` 
 * `BodyGyro_Z_Time_StdDev`

#### BodyAccJerk

Measurements describing the first derivative of body linear acceleration.

 * `BodyAccJerk_Magnitude_Frequency_Mean` 
 * `BodyAccJerk_Magnitude_Frequency_StdDev` 
 * `BodyAccJerk_Magnitude_Time_Mean` 
 * `BodyAccJerk_Magnitude_Time_StdDev` 
 * `BodyAccJerk_X_Frequency_Mean` 
 * `BodyAccJerk_X_Frequency_StdDev` 
 * `BodyAccJerk_X_Time_Mean` 
 * `BodyAccJerk_X_Time_StdDev` 
 * `BodyAccJerk_Y_Frequency_Mean` 
 * `BodyAccJerk_Y_Frequency_StdDev` 
 * `BodyAccJerk_Y_Time_Mean` 
 * `BodyAccJerk_Y_Time_StdDev` 
 * `BodyAccJerk_Z_Frequency_Mean` 
 * `BodyAccJerk_Z_Frequency_StdDev` 
 * `BodyAccJerk_Z_Time_Mean` 
 * `BodyAccJerk_Z_Time_StdDev` 

#### BodyGyroJerk

Measurements describing the first describing of the body angular velocity.

 * `BodyGyroJerk_Magnitude_Frequency_Mean` 
 * `BodyGyroJerk_Magnitude_Frequency_StdDev`
 * `BodyGyroJerk_Magnitude_Time_Mean` 
 * `BodyGyroJerk_Magnitude_Time_StdDev` 
 * `BodyGyroJerk_X_Time_Mean` 
 * `BodyGyroJerk_X_Time_StdDev` 
 * `BodyGyroJerk_Y_Time_Mean` 
 * `BodyGyroJerk_Y_Time_StdDev` 
 * `BodyGyroJerk_Z_Time_Mean` 
 * `BodyGyroJerk_Z_Time_StdDev` 

#### Gravity

Measurements describing the gravity acceleration signal. The low-frequency signal captured by the accelerometer.

 * `GravityAcc_Magnitude_Time_Mean` 
 * `GravityAcc_Magnitude_Time_StdDev` 
 * `GravityAcc_X_Time_Mean` 
 * `GravityAcc_X_Time_StdDev` 
 * `GravityAcc_Y_Time_Mean` 
 * `GravityAcc_Y_Time_StdDev` 
 * `GravityAcc_Z_Time_Mean` 
 * `GravityAcc_Z_Time_StdDev` 
