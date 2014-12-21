#Codebook

This script creates a "tidy" dataset given a set of motion tracking data collected from smart phones.

The project's goal is to organize the data into a "tidy" dataset: 

1. One variable per column
2. One observation per row
3. One type of obserational unit per table

# Data Set Information

The data is collected from Samsung Galaxy S II smart phones worn by 30 volunteers aged 19-48 years old. 
The data takes the form of 3 dimensional linear acceleration and angular velocity. 

The data is downloaded from this URL: [Get_data_files](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The data relevant to this project are stored in these text files contained in the zip file:
* X_test.txt 
* y_text.txt
* subject_test.txt
* X_train.txt
* y_train.txt
* subject_train.txt : 
* features.txt : list of features measured
* activity_labels.txt : creates a link between labels (such as 1,2,etc.) with their activity description.

This project is concerned with extracting only the mean and standard deviation measurements from the dataset.
The relevant data contains either one of these identifiers in the their variable names:

mean(): Mean value

std(): Standard deviation





original data collection by Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

