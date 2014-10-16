#Codebook 

The tidy data set is contained in a file called mean_data.txt.  This file has 85 columns of data.  

Column 1 is called "subject".  It contains values from 1 - 30 that correspond to the person (subject) being tested  

Column 2 is called "activity".  It contains one of the six following activities that the subject is performing
while being measured: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING  

Columns 3 - 79 have  motion data associated with the tests. These columns all contain mean and standard deviation values.
The descriptive names for these columns are a concatenation of four components:  

The first component is one character and is either a "t" or an "f"  If the character is a "t" this is a time raw data measurement.  
If the first charcter is an "f" then this value is the result of a fast fourier transform performed on the
associated "t" value  (eg fBodyAccmeanX is the result of a fast fourier transform performed on tBodyAccmeanX).
Fast fourier transforms were only performed on a subset of the "t" values so there is not a one to one correspondence
between "t" values and "f" values.  

The second component is of variable character length.  It starts after the "t" or "f" value and ends just before the
substring "mean" or "std".  This component represents the motion being measured.  For example column 3 has the name
tBodyAccmeanX.  The second component is BodyAcc which corresponds to the part of the name between the "t" and "mean"  

The third component is either "mean" or "std".  This indicates whether the associated value is an average or a standard
deviation.  

The fourth component shows the 3 dimensional direction of the measurement.  It can be either "X", "Y", or "Z"  

Here is an example parsing of the descriptive name for column 3.  The column name is tBodyAccmeanX.  

Since the first character is "t", this is a raw data measumrent, not the result of a fast fourier transform.  The
motion being measured is BodyAcc.  It is a mean value (not a standard deviation value).  It is measuing motion in the
X direction. 

Columns 80 - 85 have additional  mean motion data associated with the tests. These data are associated with 
angles and each name begins with "angle"

#Additional note on the measurement data  
The values shown in columns 3 - 85 are the mean of several observations (rows) from the raw data for a given subject/activity.
So for example if there are 90 rows in the raw data for subject1//activity 1, the output in the final tidy data set for
each of the motion measuremnts is the sum of the value for the 90 rows divided by 90.  












