# 2ndminiproject
# Project 1
Lines 1 and 2 loads the data.table and reshape2 packages in R

Line 4 and 5 reads the files activity_labels.txt and features.txt 
in table format and creates the vectors act_labels and features. respectively

Line 7 creates a new vector which will be useful later in extracting 
the mean and sd of each measurement

Lines 9 to 11 reads the tests sets in table format and creates the 
data frames X-test, y-test, and subject_test

Line 13 sets the names of the data frame X-test using the column names in features

Line 15 extracts only the measurements on the mean and standard deviation 
for each measurement in X_test

Lines 17 to 19 generate activity labels for y_test and subject_test

Line 21 combines the test data frames and assigns to a new vector test_data

Lines 23 to 25 reads the train sets in table format and creates 
the data frames X-train, y-train, and subject_train

Line 27 sets the names of the data frame X-train using the column names in features

Line 29 extracts only the measurements on the mean and standard deviation 
for each measurement in X_train

Lines 31 to 33 generate activity labels for y_train and subject_train

Line 35 combines the train data frames and assigns to a new vector train_data

Line 37 merges test_data and train_data and stores it to a new data frame merged_data

Lines 39 to 41 labels the data set with descriptive variable names

Line 43 creates an independent tidy data set with the average of each variable for each activity 
and each subject and assigns it to a new data set UCI_HAR_tidy_data

Line 45 exports the tidy data with file name UCI_HAR_tidy_data.txt
