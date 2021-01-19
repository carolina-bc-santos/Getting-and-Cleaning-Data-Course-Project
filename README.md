# Getting and Cleaning Data Course Project

The module **Getting and Cleaning Data** from the the Data Science Specialization at Coursera is evaluated through a final course project. This repository contains the material necessary for the evaluation of that final project.

## Description of the project

The purpose of this project is to demonstrate one's ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. Every student is required to submit: 

  + a tidy data set as described below
  + a link to a Github repository with the student's script for performing the analysis
  + a code book that describes the variables, the data, and any transformations or work that the student performed to clean up the data called CodeBook.md. 
  + a README.md in the repo, explaining how all of the scripts work and how they are connected
  
Specifically, in this project students analyse the **Human Activity Recognition Using Smartphones Data Set**. 

The script **run_analysis.R** properly summarizes the data collected in the project. The data is available on:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The abovementioned script makes the following:

  + Merges the training and the test sets to create one data set.
  + Extracts only the measurements on the mean and standard deviation for each measurement. 
  + Uses descriptive activity names to name the activities in the data set
  + Appropriately labels the data set with descriptive variable names. 
  + From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Content of the repository

This repository contains the following files:

  + **run_analysis.R** which is the script use to analyse the data
  + **tidydata.txt** which is the final data set containing information on the mean of each measurement, per subject and activity
  + **CodeBook.md** which describes each of the variables present in tidydata





