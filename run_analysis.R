#We assume that files have been download and extracted to a local directory.


#Read files into dataframes
subject_test <- read.table("./test/subject_test.txt")
subject_train <- read.table("./train/subject_train.txt")
y_test <- read.table("./test/y_test.txt")
y_train <- read.table("./train/y_train.txt")
X_test <- read.table("./test/X_test.txt")
X_train <- read.table("./train/X_train.txt")

#Add column names to y_test and subject_test and column bind this two dataframes 
colnames(y_test) <- c("activity")
colnames(subject_test) <- c("subject")
temp_test <- cbind(subject_test, y_test)
#Add labels for features column data for X_test
dummy <- scan("./features.txt", what = "character", sep = " ")
s1 <- seq(2,length(dummy), by= 2)
features <- dummy[s1]
names(X_test) <- features
#Column bind X_test and temp_test
test <- cbind(temp_test, X_test)


#Add column names to y_train and subject_train and column bind this two dataframes 
colnames(y_train) <- c("activity")
colnames(subject_train) <- c("subject")
temp_train <- cbind(subject_train, y_train)
#Add labels for features column data for X_train
names(X_train) <- features
#Column bind X_trin and temp_train
train <- cbind(temp_train, X_train)



#Merge train and test data set
mydata1 <- rbind(test, train)

#Extract only the mean and std for each measurement
mydata2 <- mydata1[ ,c(1, 2, grep("mean\\(\\)|std\\(\\)",names(mydata1)))]

#Use activity names to replace numbers
activity_names<-c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
mydata2$activity <-factor(mydata2$activity, labels = activity_names)


#aggregate to get mean of each mean and std for each subject/activity pair and to get the second independent data set
tidydata <-aggregate(mydata2[,c(3:ncol(mydata2))], by=list(subject=mydata2$subject,activity=mydata2$activity),
                     FUN=mean, na.rm=TRUE)
write.table(tidydata, file="tidydata.txt")  
