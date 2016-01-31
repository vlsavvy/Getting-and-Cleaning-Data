# 1. Merges the training and the test sets to create one data set.
rm(list=ls())

trainingDS <- cbind(read.table("./UCI HAR Dataset/train/X_train.txt"), read.table("./UCI HAR Dataset/train/subject_train.txt"), read.table("./UCI HAR Dataset/train/y_train.txt"))
testDS <- cbind(read.table("./UCI HAR Dataset/test/X_test.txt"), read.table("./UCI HAR Dataset/test/subject_test.txt"), read.table("./UCI HAR Dataset/test/y_test.txt"))

mergedData <- rbind(trainingDS, testDS)
capture.output(mergedData, file = "./merged_dataset.txt")

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- read.table("./UCI HAR Dataset/features.txt", header=FALSE, stringsAsFactors=FALSE)
features <- make.names(features[,"V2"])
mean_std <- mergedData[,grep(pattern="mean|std", x=features, ignore.case=TRUE)]

# 3. Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE, stringsAsFactors=FALSE)
activity_labels <- apply(activity_labels, 1, function(x) unlist(strsplit(x, split=" ")))
mergedData[,563] <- factor(as.factor(mergedData[,563]), labels=activity_labels[2,])

# 4. Appropriately labels the data set with descriptive activity names. 
features <- read.table("./UCI HAR Dataset/features.txt", header=FALSE, stringsAsFactors=FALSE)
features <- make.names(features[,"V2"])
features[562] = "subject"
features[563] = "activity"
colnames(mergedData) <- features

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
labels <- colnames(mergedData)[-c(562,563)]
tidyDS <- lapply(X=labels, FUN=function(x) tapply(mergedData[[x]], list(mergedData$activity, mergedData$subject), mean))
names(tidyDS) <- labels
capture.output(tidyDS, file = "./tidy_dataset.txt")
