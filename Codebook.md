#Codebook

# Introduction

This script creates a "tidy" dataset given a set of motion tracking data collected from smart phones.

The project's goal is to organize the data into a "tidy" dataset: 

1. One variable per column
2. One observation per row
3. One type of obserational unit per table

Comments in the run_analysis.r script describe what the code is doing. However, this codebook describes the data, variables, and transformative work performed on the data. 

# Data Set Information

The data is collected from Samsung Galaxy S II smart phones worn by 30 volunteers aged 19-48 years old. 
The data takes the form of 3 dimensional linear acceleration and angular velocity. 

The data is downloaded from this URL: [Get_data_files](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The data relevant to this project are stored in these text files contained in the zip file:
* X_test.txt : *Testing set*
* y_text.txt : *Testing lables*
* subject_test.txt : *Testing subject*
* X_train.txt : *Training set*
* y_train.txt : *Training labels*
* subject_train.txt : *Training subjects*
* features.txt : *list of features measured*
* activity_labels.txt : *creates a link between labels (such as 1,2,etc.) with their activity description.*



# Getting Started

After the data is downloaded, each text file is read as a table into RStudio using the Read.Table() function. 
The training sets, labels, and subjects are merged with the corresponding testing sets, labels and subjects.
The training data for all types is placed first.

The features and activity descriptions are placed in tables as well.

The features table contains the variable labels for the data in the merged X dataset.
The colnames() function is called to rename the X dataset variables (unlabelled so far) with the features variables.

The focus is on extracting only the mean and standard deviation measurements from the dataset. 
The relevant data contains either one of these identifiers in the their variable names:

* mean(): Mean value
* std(): Standard deviation

A search is performed using the  grep() fucntions to locate these in the merged X dataset using the new labels assigned from the features table.







original data collection by Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

