# Run Analysis script
# This script does the following:
# 1. Merges the training and the test sets to create one data set.
# 2. Extract only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive activity names. 
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# load the packages
if (!require("plyr")) {
  install.packages("plyr", dependencies = TRUE)
  require("plyr")
}
if (!require("reshape2")) {
  install.packages("reshape2", dependencies = TRUE)
  require("reshape2")
}
if (!require("reshape2")) {
  install.packages("data.table", dependencies = TRUE)
  require("data.table")
}

# Change working directory:
# (On a laptop running Apple's OS X Mavericks)
setwd("~/Coursera/Getting and Cleaning Data/Assignment/")

# Create data directory to store the data in:
if (!file.exists("data")) {
  dir.create("data")
}

# Download the .zip file with the provided url:
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/getdata-projectfiles-UCI.zip", method = "curl")
# unzip the getdata-projectfiles-UCI.zip file and put it in the data folder
unzip("./data/getdata-projectfiles-UCI.zip", exdir = "./data")

# 1. Load the data files
train_subject <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", sep = "\n")
test_subject <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", sep = "\n")
train_x <- read.table("./data/UCI HAR Dataset/train/X_train.txt", quote="\"")
train_y <- read.table("./data/UCI HAR Dataset/train/y_train.txt", sep="\n")
test_x  <- read.table("./data/UCI HAR Dataset/test/X_test.txt", quote="\"")
test_y  <- read.table("./data/UCI HAR Dataset/test/y_test.txt", sep="\n")

# Combine the data sources: 
# a. train_subject, train_y, train_x --> train
# b. test_subject, test_y, test_x --> test

train <- cbind(train_subject, train_y, train_x)
test  <- cbind(test_subject,  test_y,  test_x)

# final combined data (train & test):
data <- rbind(train, test)

# remove unnecessary data objects:
rm(test, test_subject, test_x, test_y, train, train_subject, train_x, train_y)

# 2. Extract only the measurements on the mean and standard deviation for each measurement. 
# Read in the variable text file
# Keep only those variables with mean or std in their name (filter out on: min, max, mad, etc.)
variable_names <- read.table("./data/UCI HAR Dataset/variables.txt", sep="\n")
variable_names <- gsub("^[0-9]+ ", "", variable_names$V1)

variables <- grepl("mean|std", variable_names)
## add two more TRUEs, because of subject and y values
variables_total <- c(TRUE, TRUE, variables)

# remove the FALSE variables from the data set
data <- data[, which(variables_total == T)]
colnames(data) <- c("subject", "activity", variable_names[variables])


# 3. Uses descriptive activity names to name the activities in the data set
# load the activities labels text file
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt", quote="\"")

# 4. Appropriately labels the data set with descriptive activity names. 
# change the activity labels to lower case character values to use them in the labels of the factor variable
data$activity <- factor(data$activity, labels = tolower(as.character(activity_labels$V2)))

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# transform the subject in the data frame also to a factor variable
data$subject <- factor(data$subject)

# a. save the data set as data.txt
write.table(data, file="./data/data_set.txt")

data_table <- data.table(data)
variables_table <- colnames(data_table)[-(1:2)]
tidy_data <- data_table[, lapply(.SD, mean), .SDcols = variables_table, 
                             by = list(subject, activity)]

# b. save the tidy data set as tidy_data.txt
write.table(tidy_data, file="./data/tidy_data.txt")

