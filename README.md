# Coursera - Getting and Cleaning Data Course Project Work - Anthony Acaldo
==========================================================================
The final project work for the Coursera - 'Getting an Cleaning Data' course is an exercise in taking 
complex and untidy data sets and transforming them into a singlular summarized tidy data set.

What follows is a description of the original data sources, then a description of the transformation
steps applied to the data sources to produce the tidy data set required for the course project.


====== ORIGINAL DATA SETS DESCRIPION   
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
=======================================================================================




====== DATA SETS TRANFORMATION PROCESS
======================================================================
The requisite data transformation consists of 5 tasks to achieve the end result of a tidy data set as described
in the Coursera - 'Getting an Cleaning Data' course project.

The above tasks are achieved with one R script called run_analysis.R.

Note - the tasks in run_analysis.R will not be done in the sequence decribed in the assignment, but
will instead be done in the sequence that is optimal for the end goal.


Scripting Environment Baseline Conditions
-----------------------------------------
- script was developed and tested in RStudio version 1.2.5033
- script presumes all Samsung data files to be present in the local working directory:

	* features.txt
	* subject_test.txt
	* subject_train.txt
	* x_test.txt
	* x_train.txt
	* y_test.txt
	* y_train.txt
	
Supporting R Libraries
----------------------
- readr - Rectangular Document Text Reader, version 1.3.1
- dplyr - A Grammer of Data Manipulation, version 0.8.3




Task 1 
------
Merge training and test sets to create one data set.

Approach:
Use read_table() function from readr library to read in files: x_test.txt, y_test.txt, and subject_test.txt,
storing data into appropriatly named tables with appropriate column headers for future manipulation.

Next, combine tables to form one table with cbind() funtion:

- my_dataTest <- cbind(my_data_subject_test, my_data_y_test, my_data_x_test)

In combining of the tables, column headers at this point will be: 

subject, activity, X1..Xnn

Next, perform the similar steps as described above for x_train.txt, y_train.txt, and subject_train.txt.

Finally, merge the two tables created in the prior steps with an rbind() function:
- my_mergeDataAll <- rbind(my_dataTest, my_dataTrain)


Unit Conversion Notes:
The original source data column values for x_test.text and x_train.txt is expressed as scientific notation. 
The values are converted to columns of type double when read into the script; this ensures ease in 
future calculations on the data, and reflects a more tidy form of data.

Ex. 

2.5717778e-001 converts to 0.25717778


Task 4
------
Appropriately label the data set with descriptive variable names.

Approach:
At this point in the processing, the column headers have the labels: subject, activity, X1..Xnn.

Subject and activity are acceptable labels, but the default X1..Xnn, have to be changed to reflect the features
coming from the features.txt in the original data set.

Use the read_table() function to read features.txt into a table so it can be combined with subject and
activity labels, with some additional manipulation, then reference the resulting feature vector and
use it as the colnames for all of the merged data set:

- colnames(my_mergeDataAll) <- my_mergeDataFeatures$feature

This will produce column labels for myMergedDataAll, that reflect subject, activity, then all of the 
features coming from the features.txt file, thus cleaning up the default X1..Xnn nomenclature.

Next, make an adjusted_names vector that can be manipulated through a number of steps to:

- make column labels lower case
- remove open and closing parenthesis
- add hyphens where needed
- remove blanks

The resulting vector will serve as a cleaned set of column names with descriptive variables for
the merged data set:

- colnames(my_mergeDataAll) <- adjusted_names



Task 3
------
Use descriptive activity names to name the activities in the data set.

Approach:
At this point in the process, we have a column in the merged data set named 'activity' that was
populated during Task 1 from the data sets y_test.txt, and y_train.txt described above.

The values in this column range from "1" to "6", and are currently of chr type.

The activity_labels.txt files links the number with a text description of the activity:

1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

Next, use the sub() function to replace the simple number chr with a full text description of what the
number represents as reflected in activity_labels.txt:

my_mergeDataAll$activity <- sub("1", "walking", my_mergeDataAll$activity)
my_mergeDataAll$activity <- sub("2", "walking_upstairs", my_mergeDataAll$activity)
my_mergeDataAll$activity <- sub("3", "walking_downstairs", my_mergeDataAll$activity)
my_mergeDataAll$activity <- sub("4", "sitting", my_mergeDataAll$activity)
my_mergeDataAll$activity <- sub("5", "standing", my_mergeDataAll$activity)
my_mergeDataAll$activity <- sub("6", "laying", my_mergeDataAll$activity)


Task 2
------
Extract only the measurements on the mean and standard deviation for each measurement.

Approach:
At this point in the process, the columns have tidy names, but there are many columns out of scope 
for the requirements in the assignment.

First, a visual inspection of features.txt indicates the locations of problematic duplicate column names.

Remove problem duplicate and out of scope columns; this cleanup also allows the use of the dplyr
select() function, which is needed for subsequent steps. 
Remove problem columns with (allow offset for subject and activity columns) :

- myResult <- my_mergeDataAll[-c(305:346, 384:425, 463:504)]

Next, use the dplyr select() function to reduce the data set to the only relevant data:

- myResult <- select(myResult, matches("(subject)|(activity)|(mean)|(std)"))



Task 5
------
From the data set in Task 4, creates a second, independent tidy data set with the average of each variable 
for each activity and each subject.

Approach:
At this point, the data set has the relevant columns needed for the assignment, the variables have tidy names,
the activities have text labels, and the test and training sets are merged.

Finally, summarize the data set, producing the average of each variable with the dplyr summarize_all() 
function that uses a group_by element for subject and activity along with a mean argument:

- by_subject_activity <- group_by(myResult, subject, activity)
- final_result <- summarise_all(by_subject_activity, mean)

Save the resulting table as final_result:

- write.table(final_result, file = "final_result.txt", row.names = FALSE)



