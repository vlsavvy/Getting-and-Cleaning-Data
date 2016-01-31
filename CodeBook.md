Getting and Cleaning Data Peer Assessment CodeBook
==================================================
This file describes the variables, the data, and any transformations or work that I have performed to clean up the data.  
* The site where the data was obtained:  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones      
The data for the project:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
* The run_analysis.R script performs the following steps to clean the data:   
 1. Reads X_train.txt, y_train.txt and subject_train.txt from the "./UCI HAR Dataset/train" folder,binds and stores them in *trainingDS*.       
 2. Reads X_test.txt, y_test.txt and subject_test.txt from the "./UCI HAR Dataset/test" folder,binds and stores them in *testDS*.       
 3. Merges trainingDS ans testDS using rbind and stores in *mergedData*.
 4. Writes the mergedData in the file *merged_dataset.txt* in the current working directory.
 5. Reads the features.txt file from the "./UCI HAR Dataset" folder and store the data in a variable called *features*. Extracts the measurements on the mean and standard deviation.
 6. Reads the activity_labels.txt file from the "./UCI HAR Dataset" folder and stores the data in a variable called *activity_labels*.  
 7. Appropriately labels the data set with descriptive activity names.
 8. Generates a second independent tidy data set with the average of each measurement for each activity and each subject. 
 9. Writes the tidy data to *tidy_dataset.txt* file in current working directory. 