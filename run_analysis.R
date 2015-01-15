# 
# Getting and cleaning data Course project 
# 
# run_analysis.R
#

# 
# Useful libraries
#

library("dplyr")

#
# Helper functions & constants
#

# Read a file in the UCI formats
read_uci_numbers <- function(file, widths=c(2)) {
  return (read.fwf(file, widths))
}

# The column widths for the feature vectors
feature_widths <- c(17, rep(1, 560)*16) # The first column is one character wider than the others

# Retain the mean and std dev measurements
filter_mean_stddev <- function(df) {
  
}

read_uci_labels <- function(file) {
  return (read.csv(file, sep=" ", header=FALSE, col.names=c("id", "label")))
}

#
# Merge training and test sets
#

# Assume data is extracted in the current directory, go to data directory
setwd("./UCI HAR Dataset/")
data_dir <- getwd()

# load base data
test_subjects <- read_uci_numbers("test/subject_test.txt")
test_activity_ids <- read_uci_numbers("test/y_test.txt")
test_features <- read_uci_numbers("test/X_test.txt", feature_widths)

train_subjects <- read_uci_numbers("train/subject_train.txt")
train_activity_ids <- read_uci_numbers("train/y_train.txt")
train_features <- read_uci_numbers("train/X_train.txt", feature_widths)

# Merge the data
subjects <- rbind (test_subjects, train_subjects)
activity_ids <- rbind (test_activity_ids, train_activity_ids)
features <- rbind(test_features, train_features)

# Load meta data
activity_labels <- read_uci_labels("activity_labels.txt")
feature_labels <- read_uci_labels("features.txt")

# Make some nice label names
labels <- feature_labels %>% 
  filter(grepl("-mean\\(",label ) | grepl ("-std\\(",label)) %>% # Only retain mean and standard deviation signals
  mutate (label = gsub("-", "_", label)) %>%                     # A hyphen is a "dangerous" character to have in a label
  mutate (label = gsub("\\(|\\)", "", label)) %>%                # Likewise parenthess might trip some R functions
  mutate (label = gsub("BodyBody", "Body", label)) %>%           # BodyBody is a mistake in the source data, let's correct it
  mutate (label = gsub("^t(.*)", "\\1_Time", label)) %>%         # t is too cryptic
  mutate (label = gsub("^f(.*)", "\\1_Frequency", label)) %>%    # f is too cryptic
  mutate (label = gsub("Mag_", "\\_Magnitude_", label)) %>%      # Mag is like X, Y and Z. It is a bit cryptic too
  mutate (label = gsub("_mean(.*)", "\\1_Mean", label)) %>%      # The mean is an operation on a measurement. Let's put the measurement name first
  mutate (label = gsub("_std(.*)", "\\1_StdDev", label))         # The standard deviation is an operation on a measurement. Let's put the measurement name first and std is confusing too

# Retain only mean and stddev and tidy up the names. *meanFreq* is not retained as it is not a mean as meant in the exercise. 
base_features <- select(features, labels$id)
names(base_features) <- labels$label

# Add subject
base_features$Subject_Id <- factor(subjects$V1)

# Add activities
base_features$Activity_Id <- activity_ids$V1

# Assign a textual label to the activity
labeled_features <- base_features %>% 
  merge(select(activity_labels, Activity_Id=id, Activity=label)) %>% # Join on Activity_Id
  select(-Activity_Id)

#
# Create a new dataset with the average per activity and subject
#

feature_means <- labeled_features %>% 
  group_by(Subject_Id,Activity) %>%   # Group by subject and activity  
  summarise_each (funs(mean))         # Calculate the mean for every other column

# Finally write to disk
write.table(feature_means, "../tidyFeatureMeans.txt", row.names = FALSE)

# Read data back
# fm <- read.table("../tidyFeatureMeans.txt", header=TRUE)