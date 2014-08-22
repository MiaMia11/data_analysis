The script run_analysis.R does the following:

    1.Reads the raw testing and training data files into R
    2.Add column names to y_test and subject_test and column bind this two dataframes to temp_test
    3.Add labels for features column data for X_test
    4.Colunm bind X_test and temp test to test dataset
    5.Doing step 2-4 again to creat train dataset
    6.Merges the final test and train data using rbind
    7.Extracts only the columns (features) that parametrize mean and std values of the various parameters (for each trial) via grep (called from R in the usual way)
    8.Use activity names to replace numbers
    9.Makes a tidy data frame that keeps only the means of the features extracted in the previous step, for each Activity and Subject
    10.Writes this tidy data frame to "tidy.txt" 

Feature description

    Each feature starts with t, indicating time series, or f, indicating frequency domain (post FFT). 
    The "X", "Y" and "Z" indicate the appropriate axes of the accelerometer. When "Mag" appears in a feature name, it denotes the magnitude of the given vector (so there is no X, Y, or Z in the feature name)
    Features measure either Gravity or Body parameters. I.e., as the device moves, its coordinate frame moves relative to the Earth, so the gravity vector moves in the device's local coordinate system.
    Two devices are used: an accelerometer and a gyroscope. The corresponding features contain "Acc" or "Gyro"
    The derivative of the acceleration is called the jerk; features given by differentiating the time series are labeled with "Jerk" in the name
    For each quantity, only the mean and standard deviation are preserved for each sample. These contain "Mean" and "Std" in their names
    Examples: the name "tBodyAccJerkStd.Z" refers to the standard deviation of the Z component of the derivative of the non-gravity components of the accelerometer during a sample collection as a time series. The name "fBodyAccJerkStd.Z" refers to the standard deviation of the FFT of the Z component of that same sample collection.
