
## This R script does the follwing:

## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for 
##    each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set 
##    with the average of each variable for each activity and each subject.

oldpath<-getwd()
#Read the training data
setwd("UCI\ HAR\ Dataset/train")
x_train<-read.table("X_train.txt",header = FALSE,sep="")
y_train<-read.table("y_train.txt",header = FALSE,sep="")
subject_train<-read.table("subject_train.txt",header = FALSE,sep = "")
#Colume bind the trainning data into oneset "data_train"
data_train<-cbind(x_train,y_train,subject_train)
setwd(oldpath)

#Read the test data
setwd("UCI\ HAR\ Dataset/test")
x_test<-read.table("X_test.txt",header = FALSE,sep="")
y_test<-read.table("y_test.txt",header = FALSE,sep="")
subject_test<-read.table("subject_test.txt",header = FALSE,sep = "")
#Colume bind the test data into one set "data_test"
data_test<-cbind(x_test,y_test,subject_test)
setwd(oldpath)

#Row bind the training data and test data into one set "data"
data<-rbind(data_train,data_test)

#Read the features names from the features discretion file and add two more
#names for the activety_labes and subject
setwd("UCI\ HAR\ Dataset")
features<-read.table("features.txt",stringsAsFactors = FALSE,col.names = c("num","featureName"))
features<-rbind(features,data.frame(num=c(562,563),featureName=c("activity_lables","subject")))
#Add features names for the final data set
names(data)=features[,2]
#Select the measurements on the mean and stadard deviation for each measurement
colume_selected<-grep("[mM]ean|[sS]td",names(data))
data<-data[,c(colume_selected,562,563)]
ac<-c("Walking","Walking_Upstairs","Walking_Downstairs","Sitting","Standing","Laying")
for(i in 1:6){
data$activity_lables<-gsub(i,ac[i],data$activity_lables)
}
setwd(oldpath)
library(dplyr)
data_final<-data%>%group_by(activity_lables,subject) %>% summarise_each(funs(mean(.,na.rm=TRUE)))

#Write the data

write.table(data_final,row.names = FALSE,file="data_final.txt")


