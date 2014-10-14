#Clean and analyze the Samsung motion data set
fileUrl<-download.file(fileUrl,destfile="./Dataset.zip")
unzip("./Dataset.zip")

# read feature names into a vector.  These will become the column names for the features in the dataset
feat<-read.table("./UCI HAR Dataset/features.txt")
feat<-feat$V2

# read train data into a DF Use feat vector to name the columns
train<-read.table("./UCI HAR Dataset/train/X_train.txt",col.names=feat)

# create a vector for train subject data and train activity data
train_subject<-read.table("./UCI HAR Dataset/train/subject_train.txt",col.names="subject")
train_activity<-read.table("./UCI HAR Dataset/train/y_train.txt",col.names="activity")

# prepend subject and activity as first two cols in train df using cbind
train<-cbind(train_subject,train_activity,train)

# read test data into a DF
test<-read.table("./UCI HAR Dataset/test/X_test.txt",col.names=feat)

# create a vector for test subject data and test activity data
test_subject<-read.table("./UCI HAR Dataset/test/subject_test.txt",col.names="subject")
test_activity<-read.table("./UCI HAR Dataset/test/y_test.txt",col.names="activity")

# prepend subject and activity as first two cols in train df using cbind
test<-cbind(test_subject,test_activity,test)

# combine the train and test data into one DF
train_and_test<-rbind(train,test)

# select only columns for mean and std
train_and_test<-train_and_test[ ,c(1,2,3,4,5,6,7,8,43,44,45,46,47,48,83,84,85,86,87,88,123,124,125,126,127,128, 163,164,165,166,167,168,203,204,216,217,229,230,242,243,255,256,268,269,270,271,272,273,296,297,298,347,348,349,350,351,352, 375,376,377,426,427,428,429,430,431,454,455,456,505,506,515,518,519,531,532,544,545,554,558,559,560,561,562,563)]

# strip the "." chars out of the column names
newNames<-gsub("\\.","",names(train_and_test),) 
colnames(train_and_test)<-newNames

# change the activity column to show the correct enumerated values from file activity_labels.txt
train_and_test$activity<-factor(train_and_test$activity,level=1:6,labels=c('WALKING','WALKING_UPSTAIRS','WALKING_DOWNSTAIRS','SITTING','STANDING','LAYING'))

#create DF final tidy data

#create empty DF for final tidy data   30 subs X 6 Activities = 180 rows   83 features + sub + act = 85 cols
mean_data<-as.data.frame(matrix (nrow=180,ncol=85,dimnames=(list(NULL,names(train_and_test)))))

#create factor of the 6 activities
act_list<-factor(c('WALKING','WALKING_UPSTAIRS','WALKING_DOWNSTAIRS','SITTING','STANDING','LAYING'))

# loop on subject and then on activity to create the final tidy DF with mean values
row_count <-0
for (sub in 1:30){
        for (act in levels(act_list)){
                row_count<-row_count + 1 # increment through the 180 rows in this table (30 Subs X 6 activities)
                
                #create tmp table for each subject/activity
                tmp_table<-train_and_test[train_and_test$subject %in% sub & train_and_test$activity == act,]
                
                # populate mean data from tmp_table to final output table
                mean_data[row_count,1]<-sub
                mean_data[row_count,2]<-act
                
                mean_data[row_count,3:85]<-as.numeric(colSums(tmp_table[3:85])/nrow(tmp_table))
                
        }
}


# write mean_data table to a file
write.table(mean_data,file="./mean_data.txt",row.name=FALSE)


