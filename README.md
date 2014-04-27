Getting-and-cleaning-data
=========================

This README contains background information about the `run_analyis.R` program.

Source of the data
------------------
Background information about the project can be found:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The data set can be obtained from here [zip.file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
The R script `run_analysis.R` also downloads it from the source.


Dependencies
------------
The program requires the following packages to be loaded:
- reshape2
- plyr
- data.table

The script will download these packages if they are not loaded at the start of your session.

Working directory
-----------------
This program is written on a laptop running Mac OS X Mavericks, therefore the settings of the R Working Directory may have to be adjusted to your own machine.

Output: data
-------
The R script `run_analysis.R` returns the following two data sets:
- `data.txt` : combines training and test data sets (together with subject and activity data) based on the variables with mean and standard deviation.
- `tidy_data.txt`: aggregate of the `data.txt` where the mean is calculated by subject and activity.


