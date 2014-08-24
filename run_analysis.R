# Step 1
# Merge the training and test sets to create one data set

x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

train_data <- cbind(x_train, y_train)
train_data <- cbind(train_data, subject_train)

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test")

test_data <- cbind(x_test, y_test)
test_data <- cbind(test_data, subject_test)

all_data <- rbind(train_data, test_data)

# Step 2
# Extract only the measurements on the mean and standard deviation for each measurement

features <- read.table("features.txt")
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])
x_data <- rbind(x_train, x_test)
x_mean_and_std_data <- x_data[, mean_and_std_features]
names(x_mean_and_std_data) <- features[mean_and_std_features, 2]
