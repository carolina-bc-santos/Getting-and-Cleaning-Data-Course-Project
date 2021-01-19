# Load the required packages
library(data.table)
library(dplyr)
library(tidyr)

# 1. Merges the training and the test sets to create one data set

  # 1.1. Reading test data

  xtest<-read.table('UCI HAR Dataset/test/X_test.txt')
  ytest<-read.table('UCI HAR Dataset/test/y_test.txt')
  subjecttest<-read.table('UCI HAR Dataset/test/subject_test.txt')
  
    # 1.1.1. Binding columns of the above tables to get the test data set
  
    test<-cbind(subjecttest,ytest,xtest)

  # 1.2. Reading train data
  
  xtrain<-read.table('UCI HAR Dataset/train/X_train.txt')
  ytrain<-read.table('UCI HAR Dataset/train/y_train.txt')
  subjectrain<-read.table('UCI HAR Dataset/train/subject_train.txt')
  
    # 1.2.1. Binding columns of the above tables to get the train data set
  
    train<-cbind(subjectrain,ytrain,xtrain)
  
  # 1.3. Merging the test and train data sets to create one data set
  
  data<-rbind(test,train)
  names(data)[1]<-"subject"
  names(data)[2]<-"activity" 
  
  
# 2. Extracts only the measurements on the mean and standard deviation for each measurement

  # 2.1. Reading features data set
  
  features<-read.table('UCI HAR Dataset/features.txt')

  # 2.2.Extracting only the measurements on the mean and standard deviation for each measurement
  
  meanstd<-features[grep("(mean|std)\\(\\)",features$V2),]
  
  # From data, we want to keep only the variables that are in meanstd

  keep<-as.vector(meanstd$V1)
  keepintermediate<-paste("V",keep,sep="")
  keepvariables<-c("subject","activity",keepintermediate)
  
  finaldata<-data[,keepvariables]
  
# 3. Uses descriptive activity names to name the activities in the data set

  # 3.1. Reading the data set containing the activity labels
  
  activitydata<-read.table('UCI HAR Dataset/activity_labels.txt')
  
  # 3.3. Rename the name of the first column of "activity". 
  
  names(activitydata)[1]<-"activity"
  names(activitydata)[2]<-"activitydescription"
  
  
  # 3.4. Use the activity labels of the data set "activitydata" to name the activities in the data set "data"
  
  finaldata[,2]<-activitydata[finaldata[,2],2]
  
# 4. Appropriately labels the data set with descriptive variable names
  
  # The first two columns of the data set were already named appropriately in step 3.2.
  
  # For the remaining variables the name corresponds to the names in the data set "meanstd"
  # where we have "-mean-()" we want to substitute by "mean"
  # Where we have "-std()" we want to substitute by "std"
  
  meanstd$V2<-gsub("-","",meanstd$V2)
  meanstd$V2<-sub("\\(","",meanstd$V2)
  meanstd$V2<-sub("\\)","",meanstd$V2)
  
  labels<-as.character(meanstd$V2)
  
  names(finaldata)<-c("subject","activity",labels)
  

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
  
tidydata<-finaldata %>% group_by(subject,activity) %>% summarise_all(mean)
      
write.table(tidydata,file=file.path("tidy.data"))
  