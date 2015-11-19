# HumanActivityRecognitioin

## First step: Read the data
* Read the training data include "x_train", "y_train" and "subject_train"
* Use cbind to combile them together by coloumes, assign to data_train
* Read the test data include "x_test", "y_test" and "subject_test"
* Use rbind to combine the test data by columes, aggign to data_test

## Second step: merge the data
* Use rbind to combine the "data_train" and "data_test", assign data

## Third step: Name the features
* Read the feature names in the file call "features". the names is this file
  is very discriptive. Assign to features
* Add two more element, "activity_lables" and "subject" to features, this two names are used 
  to name the last two columes which represent actively_lables and subjects
* Use names function to name the colomus of data by features

## Fouth step: Select features
* Use the grep function to find the features which contain "[Mm]ean" or "[Ss]td"
* Subset these features and two more features,"activity_lables" and "subject", assign to data

## Fouth step: Repalce the values of activity_lables by more discriptive names
* Repalce the values of activity_lables by gsub function: 1 to "Walking", 2 to "Walking_upstairs", 
  3 to "Walking_Downstairs", 4 to Sitting, and 5 to "Laying". 

## Create a new data set
* Use gourp_by function to group the data by "activity_lables" and "subject", and use summarise_each
  with function mean to get the new data set.

## Write the data
* Use write.table to write the data into a .txt file. 

