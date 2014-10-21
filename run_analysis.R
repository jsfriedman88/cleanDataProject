#clean and analyze the Samsung motion data set
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

# get set of columns with "mean" in their name
mean_feats<-grep("mean",feat,ignore.case=TRUE)

# get set of columns with "std" in their name
std_feats<-grep("std",feat,ignore.case=TRUE)

# combine mean and std lists and sort in ascending order
combined_feats<-c(mean_feats,std_feats)
combined_feats<-sort.int(combined_feats)

# add 2 to the combined feats vector to offset for subject,activity
combined_feats<-combined_feats+2

# select only columns with mean and std in their name from the combined train and test DF. also prepend subject and activity columns
train_and_test<-train_and_test[ ,c(1,2,combined_feats)]


# strip the "." chars out of the column names
newNames<-gsub("\\.","",names(train_and_test),) 
colnames(train_and_test)<-newNames

# change the activity column to show the correct enumerated values from file activity_labels.txt
train_and_test$activity<-factor(train_and_test$activity,level=1:6,labels=c('WALKING','WALKING_UPSTAIRS','WALKING_DOWNSTAIRS','SITTING','STANDING','LAYING'))

#create DF final tidy data

#create empty DF for final tidy data   30 subs X 6 Activities = 180 rows   86 features + sub + act = 88 cols
mean_data<-as.data.frame(matrix (nrow=180,ncol=88,dimnames=(list(NULL,names(train_and_test)))))

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
                
                mean_data[row_count,3:88]<-as.numeric(colSums(tmp_table[3:88])/nrow(tmp_table))
                
        }
}


# write mean_data table to a file
write.table(mean_data,file="./mean_data.txt",row.name=FALSE)


