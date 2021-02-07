Codebook/Feature Selection - Modified for Course Project Criteria
========================================================

The features decribed below reflect a distillation of data collected from the 
Human Activity Recognition Using Smartphones Dataset, decscribed in the
README.txt included with this Coursera course project assignment for:
Getting and Cleaning Data.

The resulting data set features reflect the extraction of mean and standard deviation measurements, the mean of those extracted measurements along with the subject number and the activity observed.


The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tacc-xyz and tgyro-xyz. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tbodyacc-xyz and tgravityacc-xyz) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tbodyaccjerk-xyz and tbodygyrojerk-xyz). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tbodyaccmag, tgravityaccmag, tbodyaccjerkmag, tbodygyromag, tbodygyrojerkmag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fbodyacc-xyz, fbodyaccjerk-xyz, fbodygyro-xyz, fbodyaccjerkmag, fbodygyromag, fbodygyrojerkmag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-xyz' is used to denote 3-axial signals in the x, y and z directions.

subject

activity

tbodyacc-xyz

tgravityacc-xyz

tbodyaccjerk-xyz

tbodygyro-xyz

tbodygyrojerk-xyz

tbodyaccmag

tgravityaccmag

tbodyaccjerkmag

tbodygyromag

tbodygyrojerkmag

fbodyacc-xyz

fbodyaccjerk-xyz

fbodygyro-xyz

fbodyaccmag

fbodyaccjerkmag

fbodygyromag


fbodygyrojerkmag

The set of variables that were estimated from these signals are: 

mean: Mean value
std: Standard deviation
meanfreq: Weighted average of the frequency components to obtain a mean frequency

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle variable:

gravitymean

tbodyaccmean

tbodyaccjerkmean

tbodygyromean

tbodygyrojerkmean


**The complete list of variables of each feature vector follow.**

*Note: 
Units are type chr for subject and activity,
all others are type double:*


1 subject

2 activity

3 tbodyacc-mean-x

4 tbodyacc-mean-y

5 tbodyacc-mean-z

6 tbodyacc-std-x

7 tbodyacc-std-y

8 tbodyacc-std-z

9 tgravityacc-mean-x

10 tgravityacc-mean-y

11 tgravityacc-mean-z

12 tgravityacc-std-x

13 tgravityacc-std-y

14 tgravityacc-std-z

15 tbodyaccjerk-mean-x

16 tbodyaccjerk-mean-y

17 tbodyaccjerk-mean-z

18 tbodyaccjerk-std-x

19 tbodyaccjerk-std-y

20 tbodyaccjerk-std-z

21 tbodygyro-mean-x

22 tbodygyro-mean-y

23 tbodygyro-mean-z

24 tbodygyro-std-x

25 tbodygyro-std-y

26 tbodygyro-std-z

27 tbodygyrojerk-mean-x

28 tbodygyrojerk-mean-y

29 tbodygyrojerk-mean-z

30 tbodygyrojerk-std-x

31 tbodygyrojerk-std-y

32 tbodygyrojerk-std-z

33 tbodyaccmag-mean

34 tbodyaccmag-std

35 tgravityaccmag-mean

36 tgravityaccmag-std

37 tbodyaccjerkmag-mean

38 tbodyaccjerkmag-std

39 tbodygyromag-mean

40 tbodygyromag-std

41 tbodygyrojerkmag-mean

42 tbodygyrojerkmag-std

43 fbodyacc-mean-x

44 fbodyacc-mean-y

45 fbodyacc-mean-z

46 fbodyacc-std-x

47 fbodyacc-std-y

48 fbodyacc-std-z

49 fbodyacc-meanfreq-x

50 fbodyacc-meanfreq-y

51 fbodyacc-meanfreq-z

52 fbodyaccjerk-mean-x

53 fbodyaccjerk-mean-y

54 fbodyaccjerk-mean-z

55 fbodyaccjerk-std-x

56 fbodyaccjerk-std-y

57 fbodyaccjerk-std-z

58 fbodyaccjerk-meanfreq-x

59 fbodyaccjerk-meanfreq-y

60 fbodyaccjerk-meanfreq-z

61 fbodygyro-mean-x

62 fbodygyro-mean-y

63 fbodygyro-mean-z

64 fbodygyro-std-x

65 fbodygyro-std-y

66 fbodygyro-std-z

67 fbodygyro-meanfreq-x

68 fbodygyro-meanfreq-y

69 fbodygyro-meanfreq-z

70 fbodyaccmag-mean

71 fbodyaccmag-std

72 fbodyaccmag-meanfreq

73 fbodybodyaccjerkmag-mean

74 fbodybodyaccjerkmag-std

75 fbodybodyaccjerkmag-meanfreq

76 fbodybodygyromag-mean

77 fbodybodygyromag-std

78 fbodybodygyromag-meanfreq

79 fbodybodygyrojerkmag-mean

80 fbodybodygyrojerkmag-std

81 fbodybodygyrojerkmag-meanfreq

82 angle-tbodyaccmean-gravity

83 angle-tbodyaccjerkmean)-gravitymean

84 angle-tbodygyromean-gravitymean

85 angle-tbodygyrojerkmean-gravitymean

86 angle-x-gravitymean

87 angle-y-gravitymean

88 angle-z-gravitymean


