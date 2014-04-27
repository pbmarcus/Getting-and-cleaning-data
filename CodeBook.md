Background of the data
----------------------
Information about the data collection and the differet data sets can be found in the `README.txt` file associated with the data. All the information can be obtained from [zip file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).


Transformations made
--------------------
I have not mady any transformations with the data. The collected data has already been "Features are normalized and bounded within [-1,1]. according to the `README.txt` file associated with the data. The description can be found in the next section.

For my analysis I have done the following steps:
- Binding the `subject_train.txt`, `X_train.txt` and `y_train.txt` data sets to obtain the `train` data set.
- Binding the `subject_test.txt`, `X_test.txt` and `y_test.txt` data sets to obtain the `test` data set.
- Binding the `train` and `test` data sets to obtain my `data`.
- From `variables.txt` I selected the variables with mean and standard deviation (dimension reduction from 563 to 81 variables.
- From `activity_labels.txt` I replaced the `y` variable in the `data` set, thereby changing it from an integer to a factor
- Changing the subjects (from `subject_train.txt` and `subject_test.txt`) from numeric to categorical values.

Variables in the data set
------------------------

| Name | Type | Description |
| ---- | ---- | ----------- |
|activity | categorical| performed activity |
|subject  | categorical| unique id per subject |
|BodyAcc-XYZ | continuous | more detailed info see below |
|tGravityAcc-XYZ | continuous | 
|tBodyAccJerk-XYZ | continuous | 
|tBodyGyro-XYZ | continuous | 
|tBodyGyroJerk-XYZ | continuous | 
|tBodyAccMag | continuous | 
|tGravityAccMag | continuous | 
|tBodyAccJerkMag | continuous | 
|tBodyGyroMag | continuous | 
|tBodyGyroJerkMag | continuous | 
|fBodyAcc-XYZ | continuous | 
|fBodyAccJerk-XYZ | continuous | 
|fBodyGyro-XYZ | continuous | 
|fBodyAccMag | continuous | 
|fBodyAccJerkMag | continuous | 
|fBodyGyroMag | continuous | 
|fBodyGyroJerkMag | continuous | 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Furthermore: the set of variables that were estimated from these signals are: 
- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.
