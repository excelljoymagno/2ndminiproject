library("data.table")
library("reshape2")

act_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
features <- read.table("./UCI HAR Dataset/features.txt")[,2]

extract_measurements <- grepl("mean|std", features)

X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

names(X_test) <- features

X_test <- X_test[,extract_measurements]

y_test[,2] <- act_labels[y_test[,1]]
names(y_test) <- c("Activity_ID", "Activity_Label")
names(subject_test) <- "subject"

test_data <- cbind(as.data.table(subject_test), y_test, X_test)

X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

names(X_train) <- features

X_train <- X_train[,extract_measurements]

y_train[,2] <- act_labels[y_train[,1]]
names(y_train) <- c("Activity_ID", "Activity_Label")
names(subject_train) <- "subject"

train_data <- cbind(as.data.table(subject_train), y_train, X_train)

merged_data <- rbind(test_data, train_data)

id_labels <- c("subject", "Activity_ID", "Activity_Label")
data_labels <- setdiff(colnames(merged_data), id_labels)
melt_data <-  melt(merged_data, id = id_labels, measure.vars = data_labels)

UCI_HAR_tidy_data <- dcast(melt_data, subject + Activity_Label ~ variable, mean)

write.table(UCI_HAR_tidy_data, file = "./UCI_HAR_tidy_data.txt")