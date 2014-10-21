#Codebook 

The tidy data set is contained in a file called mean_data.txt.  This file has 88 columns of data.  

Column 1 is called "subject".  It contains values from 1 - 30 that correspond to the person (subject) being tested  

Column 2 is called "activity".  It contains one of the six following activities that the subject is performing
while being measured: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING  

Columns 3 - 88 have  motion data associated with the tests. The names for these columns given in the raw
 data set are terse, but they provide a good description
of the data.  Rather than create long more word-like names for these columns this codebook takes the
approach of using the existing column names and explicitly explaining all terse naming conventions.  
Special characters (eg ".") have been removed from the column names to satisfy the course requirement 
for modifying column names.  These columns all contain mean and standard deviation values.
Below is an explanation of the naming components:  

If the first character of the column name is a "t" then the column has time data.  The units for
these columns are seconds.  
  
If the first character is an "f" then this value is the result of a fast fourier transform performed on the
associated "t" value  (eg fBodyAccmeanX is the result of a fast fourier transform performed on tBodyAccmeanX).
Fast fourier transforms were only performed on a subset of the "t" values so there is not a one to one correspondence
between "t" values and "f" values.  The units for these columns are frequency 

mean = average  
  
std = standard deviation  (All of these columns are either mean or std values, so each columname will 
have either mean or std in its name)

acc = acceleration  

gyro = gyroscope  

mag = magnitude  

freq = frequency  

gravity = acceleration due to gravity   

jerk = jerking motion  

body = full body measurement  


X = 3 dimensional X direction  

Y = 3 dimensional Y direction  

Z = 3 dimensional Z direction  

angle = signifies a measurement of the angle between vectors.  Columns with angle will not have
"t" or "f" as the first character.  Some columns with angle have a "t" embedded just after the term angle  

A list of the column names for columns 3 - 88 is shown below:  

tBodyAccmeanX 
 
tBodyAccmeanY  

tBodyAccmeanZ  

tBodyAccstdX  

tBodyAccstdY  

tBodyAccstdZ  

tGravityAccmeanX  

tGravityAccmeanY  
	
tGravityAccmeanZ  

tGravityAccstdX  

tGravityAccstdY  

tGravityAccstdZ  

tBodyAccJerkmeanX  

tBodyAccJerkmeanY  

tBodyAccJerkmeanZ  

tBodyAccJerkstdX  

tBodyAccJerkstdY  

tBodyAccJerkstdZ  

tBodyGyromeanX  

tBodyGyromeanY  

tBodyGyromeanZ  

tBodyGyrostdX  
	
tBodyGyrostdY  

tBodyGyrostdZ  

tBodyGyroJerkmeanX  

tBodyGyroJerkmeanY  

tBodyGyroJerkmeanZ  

tBodyGyroJerkstdX  

tBodyGyroJerkstdY  

tBodyGyroJerkstdZ  

tBodyAccMagmean  

tBodyAccMagstd  

tGravityAccMagmean  

tGravityAccMagstd  
	
tBodyAccJerkMagmean  

tBodyAccJerkMagstd  

tBodyGyroMagmean  

tBodyGyroMagstd  

tBodyGyroJerkMagmean  

tBodyGyroJerkMagstd	  
	
fBodyAccmeanX  

fBodyAccmeanY	
	
fBodyAccmeanZ	
	
fBodyAccstdX	
	
fBodyAccstdY	
	
fBodyAccstdZ	
	
fBodyAccmeanFreqX	
	
fBodyAccmeanFreqY	
	
fBodyAccmeanFreqZ	
	
fBodyAccJerkmeanX	
	
fBodyAccJerkmeanY	
	
fBodyAccJerkmeanZ	
	
fBodyAccJerkstdX	
	
fBodyAccJerkstdY	
	
fBodyAccJerkstdZ	
	
fBodyAccJerkmeanFreqX	
	
fBodyAccJerkmeanFreqY	
	
fBodyAccJerkmeanFreqZ	
	
fBodyGyromeanX	
	
fBodyGyromeanY	
		
	
fBodyGyrostdY	
	
fBodyGyrostdZ	
	
fBodyGyromeanFreqX	
	
fBodyGyromeanFreqY	
	
fBodyGyromeanFreqZ	
	
fBodyAccMagmean	
	
fBodyAccMagstd	
	
fBodyAccMagmeanFreq	
	
fBodyBodyAccJerkMagmean	
	
fBodyBodyAccJerkMagstd	
	
fBodyBodyGyroMagmean	
	
fBodyBodyGyroMagstd

	 
fBodyBodyGyroJerkMagmean	
	
fBodyBodyGyroJerkMagstd	 

fBodyBodyGyroJerkMagmeanFreq	

angletBodyAccJerkMeangravityMean	

angletBodyGyroMeangravityMean	

angletBodyGyroJerkMeangravityMean	

angleXgravityMean	

angleYgravityMean	

angleZgravityMean  

#Additional note on the measurement data  
The values shown in columns 3 - 88 are the average of several observations (rows) from the raw data for a given subject/activity.
So for example if there are 95 rows in the raw data for subject1//activity 1, the output in the final tidy data set for
each of the motion measurements is the sum of the value for the 95 rows divided by 95.  












