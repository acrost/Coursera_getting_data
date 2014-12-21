

# Date source: "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# Data was unzipped


# 1. Read in and merge raw data

# Read in raw data from the test folder. 

X.test<-read.table("UCI HAR Dataset/test/X_test.txt")
Y.test <-read.table("UCI HAR Dataset/test/y_test.txt")
Subj.test <-read.table("UCI HAR Dataset/test/subject_test.txt")

# Read in raw data from the train folder

X.train<-read.table("UCI HAR Dataset/train/X_train.txt")
Y.train <-read.table("UCI HAR Dataset/train/y_train.txt")
Subj.train <-read.table("UCI HAR Dataset/train/subject_train.txt")

# Merge data from train and test folders together: X, Y, and subject.
# Train data goes first

X.together<-rbind(X.train, X.test)
Y.together<-rbind(Y.train, Y.test)
Subj.together<-rbind(Subj.train, Subj.test)

# Read in the features and the activities labels

features<-read.table("UCI HAR Dataset/features.txt")
activities<-read.table("UCI HAR Dataset/activity_labels.txt")

# assign labels for merged X dataset from the features text file

colnames(X.together)<-features[, "V2"]

# 2.
# Find out which columns are needed. 
# According to the codebook, "-std()" and "-mean()" are the stadard deviation
# and mean columns. 
# Only use the columns for standard deviation on mean

Stds_and_Means<-grep("-mean\\(\\)|-std\\(\\)", features[,2])
X.together<-X.together[,Stds_and_Means]



# 4.
# Clean up variable names in merged X dataset. Substitute with descriptive variable names

colnames(X.together)<-gsub("-std\\(\\)", "Standard_Dev", colnames(X.together))
colnames(X.together)<-gsub("-mean\\(\\)", "Mean", colnames(X.together))
colnames(X.together)<-gsub("Freq", "Frequency", colnames(X.together))
colnames(X.together)<-gsub("-", "_", colnames(X.together))

# Assign column names for subjects and activities

names(Subj.together)<-"Subject"
names(Y.together)<-"Activity"

# 3.
# Replace activities in merged Y data with descriptions "Walking", etc.

Y.together<-activities[Y.together[,1], 2]

# Place all the data together

New_Data<-cbind(Subj.together, Y.together, X.together)

#5. Calculate mean of tidy data (on everything but Subject and Activity, but order by those two)

Final_Data<-aggregate(New_Data[3:NCOL(New_Data)], list(New_Data$Subject, New_Data$Activities), mean)
colnames(Final_Data)[1]<-"Subject"
colnames(Final_Data)[2]<-"Activities"

# Write Tidy data table
write.table(Final_Data, "tidy.txt")
