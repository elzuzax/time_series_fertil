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
# present in the dataset. Due to degrees of freedom < number of
# observed years?

# Unable to attribute source of data - came from Metrics course

library(tidyverse)

#MUST LOAD FERTIL3 DATASET HERE!
#FERTIL3 <- readRDS("./FERTIL3.rds"),
#Alternatively, import via RStudio
#library(haven) required for original Stata .dta

#make new data frame with "great depression" indicator.
#set gd = 1 for years 1930-1939
fertil3gd <- mutate(FERTIL3, gd = 0)
fertil3gd[18:27, 25] = 1

regCubicNoGd <- lm(gfr ~ pe + pe_1 + pe_2 + ww2 + pill + t + tsq + tcu, data = fertil3gd)
regCubicWithGd <- lm(gfr ~ pe + pe_1 + pe_2 + ww2 + pill + gd + t + tsq + tcu, data = fertil3gd)

gfrhatNoGd <- as.data.frame(predict(regCubicNoGd))
gfrhatWithGd <- as.data.frame(predict(regCubicWithGd))
gfrhatNoGd <- mutate(gfrhatNoGd, year = row_number() + 1915)
gfrhatWithGd <- mutate(gfrhatWithGd, year = row_number() + 1915)

colnames(gfrhatNoGd)[1] <- "gfrhat"
colnames(gfrhatWithGd)[1] <- "gfrhat"

ggplot() + 
    geom_point(data = gfrhatNoGd, mapping = aes(x = year, y = gfrhat), color = "red") + 
    geom_point(data = gfrhatWithGd, mapping = aes(x = year, y = gfrhat), color = "blue") +
    geom_line(data = FERTIL3, mapping = aes(x = year, y = gfr)) + 
    coord_cartesian(ylim = c(60, 140))
