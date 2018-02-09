# Using a dataset describing general fertility rates from 
# years 1913-1984, this code shows how to obtain time-series
# predicted values from observated data and plot them against
# said observed fertility values. The dataset contains dummy
# variables for World War II and existence of the birth control
# pill, but lacks a dummy variable for the Great Depression Era
# (defined here as lasting from 1930-1939). A Great Depression
# dummy var (gd) is added in via code, and predictions are plotted 
# against observed rates. Red dots indicate predictions lacking
# the gd dummy, and blue dots indicate predictions WITH the gd
# dummy. 
#
# Note that the first 3 values are omitted in the graph (which are
# present in the dataset). Due to degrees of freedom < number of
# observed years?

# Unable to attribute source of data - came from Metrics course
# Thanks to Professor Donald for sparking my interest in Metrics
# and letting me take up space his graduate class!
