## Supporting Libraries

library(readr)
library(dplyr)

#References for my local dev testing
#dir <- "C:\\R_ProjectsWorkspace\\GettingAndCleaningDataWeek4\\FinalProject\\getdata_projectfiles_UCI HAR Dataset\\UCI HAR Dataset\\MyTempWorkArea"
#setwd(dir)


###### T a s k - 1 #################################################################
#
# Merge training and test sets to create one data set.
#

file <- "x_test.txt" #test set (rows of data)
my_data_x_test <- read_table(file, col_names = FALSE)
file <- "y_test.txt" #test labels (y-vertical col)
my_data_y_test <- read_table(file, col_names = "activity", col_types = cols(col_character()))
file <- "subject_test.txt" #test labels (y-vertical col)
my_data_subject_test <- read_table(file, col_names = "subject", col_types = cols(col_character()))
my_dataTest <- cbind(my_data_subject_test, my_data_y_test, my_data_x_test)

########

file <- "x_train.txt" #train set (rows of data)
my_data_x_train <- read_table(file, col_names = FALSE)
file <- "y_train.txt" #train labels (y-vertical col)
my_data_y_train <- read_table(file, col_names = "activity", col_types = cols(col_character()))
file <- "subject_train.txt" #train labels (y-vertical col)
my_data_subject_train <- read_table(file, col_names = "subject", col_types = cols(col_character()))

my_dataTrain <- cbind(my_data_subject_train, my_data_y_train, my_data_x_train)

my_mergeDataAll <- rbind(my_dataTest, my_dataTrain)



###### T a s k - 4 #################################################################
#
# Appropriately label the data set with descriptive variable names.
#

file <- "features.txt"
my_dataFeatures <- read.table(file, col.names = c("rowNum", "feature"))

feature.data <- data.frame(c(0,1), c("subject","activity"))

colnames(feature.data) <- c("rowNum", "feature")

my_mergeDataFeatures <- rbind(feature.data, my_dataFeatures)

colnames(my_mergeDataAll) <- my_mergeDataFeatures$feature


adjusted_names <- tolower(names((my_mergeDataAll)))

adjusted_names <- sub("\\(", " ", adjusted_names, )

adjusted_names <- sub("\\)", " ", adjusted_names, )

adjusted_names <- sub("\\)", " ", adjusted_names, )

adjusted_names <- sub("  ", "", adjusted_names, )

adjusted_names <- sub("  ", "", adjusted_names, )

adjusted_names <- sub("n ", "n", adjusted_names, )

adjusted_names <- sub("y ", "y", adjusted_names, )

adjusted_names <- sub("angle ", "angle-", adjusted_names, )

adjusted_names <- sub(",", "-", adjusted_names, )

adjusted_names <- sub("  ", "", adjusted_names, )

adjusted_names <- sub("  ", "", adjusted_names, )

colnames(my_mergeDataAll) <- adjusted_names


###### T a s k - 3 #################################################################
#
# Use descriptive activity names to name the activities in the data set.
#


my_mergeDataAll$activity <- sub("1", "walking", my_mergeDataAll$activity)
my_mergeDataAll$activity <- sub("2", "walking_upstairs", my_mergeDataAll$activity)
my_mergeDataAll$activity <- sub("3", "walking_downstairs", my_mergeDataAll$activity)
my_mergeDataAll$activity <- sub("4", "sitting", my_mergeDataAll$activity)
my_mergeDataAll$activity <- sub("5", "standing", my_mergeDataAll$activity)
my_mergeDataAll$activity <- sub("6", "laying", my_mergeDataAll$activity)


###### T a s k - 2 #################################################################
#
# Extract only the measurements on the mean and standard deviation for each measurement.
#

myResult <- my_mergeDataAll[-c(305:346, 384:425, 463:504)]

myResult <- select(myResult, matches("(subject)|(activity)|(mean)|(std)"))



###### T a s k - 5 #################################################################
#
#  From the data set in Task 4, creates a second, independent tidy data set with the average of each variable 
#  for each activity and each subject.
#

by_subject_activity <- group_by(myResult, subject, activity)
final_result <- summarise_all(by_subject_activity, mean)

write.table(final_result, file = "final_result.txt", row.names = FALSE)











