library('ProjectTemplate')
load.project()


png(filename = "graphs/seasons-barplot.png")
barplot(table(train[["season"]]), xlab = "Season", ylab = "Number", main = "Barplot of Seasons in the Train Data")
dev.off()

png(filename = "graphs/holiday-barplot.png")
barplot(table(train[["holiday"]]), xlab = "Holiday", ylab = "Number", main = "Barplot of Holidays in the Train Data")
dev.off()

png(filename = "graphs/workingday-barplot.png")
barplot(table(train[["workingday"]]), xlab = "Working Day", ylab = "Number", main = "Barplot of Working Days in the Train Data")
dev.off()

png(filename = "graphs/weather-barplot.png")
barplot(table(train[["weather"]]), xlab = "Weather Code", ylab = "Number", main = "Barplot of Weather in the Train Data")
dev.off()

png(filename = "graphs/temp-histogram.png")
hist(train[["temp"]], xlab = "Temperature (Celsius)", ylab = "Frequency", main = "Histogram of Temperatures in the Train Data")
dev.off()

png(filename = "graphs/atemp-histogram.png")
hist(train[["atemp"]], xlab = "'Feels Like' Temperature (Celsius)", ylab = "Frequency", main = "Histogram of 'Feels Like' Temperatures in the Train Data")
dev.off()

png(filename = "graphs/humidity-histogram.png")
hist(train[["humidity"]], xlab = "Relative Humidity", ylab = "Frequency", main = "Histogram of Relative Humidity in the Train Data")
dev.off()

png(filename = "graphs/windspeed-histogram.png")
hist(train[["windspeed"]], xlab = "Windspeed", ylab = "Frequency", main = "Histogram of Windspeed in the Train Data")
dev.off()

#We can see long-tailed data below
png(filename = "graphs/casual-histogram.png")
hist(train[["casual"]], breaks = 40, xlab = "Number of non-registered user rentals initiated", ylab = "Frequency", main = "Histogram of Non registered Users")
dev.off()

#We can see long-tailed data below again
png(filename = "graphs/registered-histogram.png")
hist(train[["registered"]], breaks = 80, xlab = "Number of registered user rentals initiated", ylab = "Frequency", main = "Histogram of registered Users")
dev.off()


#We can see long-tailed data below yet again
png(filename = "graphs/count-histogram.png")
hist(train[["count"]], breaks = 80, xlab = "Number of total rentals", ylab = "Frequency", main = "Histogram of Total Rentals")
dev.off()

#Boxplots of count data
png(filename = "graphs/casual-boxplot.png")
boxplot(train[["casual"]], main = "Boxplot of number of non-registered user rentals initiated")
dev.off()

png(filename = "graphs/registered-boxplot.png")
boxplot(train[["registered"]], main = "Boxplot of number of registered user rentals initiated")
dev.off()

png(filename = "graphs/count-boxplot.png")
boxplot(train[["count"]], main = "Boxplot of number of total rentals")
dev.off()


png(filename = "graphs/casual-vs-season-boxplot.png")
plot(train$season, train$casual, xlab = "Season", ylab = "Number of non-registered user rentals initiated", main = "Boxplot: Season vs Casual Users")
dev.off()

png(filename = "graphs/registered-vs-season-boxplot.png")
plot(train$season, train$registered, xlab = "Season", ylab = "Number of registered user rentals initiated", main = "Boxplot: Season vs Registered Users")
dev.off()

png(filename = "graphs/count-vs-season-boxplot.png")
plot(train$season, train$count, xlab = "Season", ylab = "Total number of users", main = "Boxplot: Season vs Total Users")
dev.off()

png(filename = "graphs/mean-vs-variance-count-barplot.png")
barplot(c(mean(train$count), var(train$count)), names.arg = c("Mean", "Variance"), ylab = "Value", main= "Mean vs Variance Barplot in Train Data")
dev.off()

png(filename = "graphs/count-vs-season-weather-boxplot.png")
boxplot(count ~ season + weather, data = train, xlab = "Season.Weather Code", ylab = "Total Number of Users", main = "Count vs Season & Weather Boxplot")
dev.off()

png(filename = "graphs/count-vs-season-weather-holiday-boxplot.png")
boxplot(count ~ season + weather + holiday, data = train, xlab = "Season.Weather.Holiday Code", ylab = "Total Number of Users", main = "Count vs Season, Weather & Holiday Boxplot")
dev.off()


png(filename = "graphs/casual-temp-scatterplot.png")
plot(train[["temp"]], train[["casual"]], xlab = "Temperature (in Celcius)", ylab = "Number of non-registered user rentals initiated", main = "Casual Users vs Temperature")
dev.off()

png(filename = "graphs/count-temp-scatterplot.png")
plot(train[["temp"]], train[["count"]], xlab = "Temperature (in Celcius)", ylab = "Total Number of Users", main = "Total Number of Users vs Temperature")
dev.off()

png(filename = "graphs/registered-temp-scatterplot.png")
plot(train[["temp"]], train[["registered"]], xlab = "Temperature (in Celcius)", ylab = "Number of registered user rentals initiated", main = "Registered Users vs Temperature")
dev.off()


png(filename = "graphs/casual-humidity-scatterplot.png")
plot(train[["humidity"]], train[["casual"]], xlab = "Relative Humidity", ylab = "Number of non-registered user rentals initiated", main = "Casual Users vs Humidity")
dev.off()

png(filename = "graphs/count-humidity-scatterplot.png")
plot(train[["humidity"]], train[["count"]], xlab = "Relative Humidity", ylab = "Total Number of Users", main = "Total Number of Users vs Humidity")
dev.off()

png(filename = "graphs/registered-humidity-scatterplot.png")
plot(train[["humidity"]], train[["registered"]], xlab = "Relative Humidity", ylab = "Number of registered user rentals initiated", main = "Registered Users vs Humidity")
dev.off()


png(filename = "graphs/casual-windspeed-scatterplot.png")
plot(train[["windspeed"]], train[["casual"]], xlab = "Windspeed", ylab = "Number of non-registered user rentals initiated", main = "Casual Users vs Windspeed")
dev.off()

png(filename = "graphs/count-windspeed-scatterplot.png")
plot(train[["windspeed"]], train[["count"]], xlab = "Windspeed", ylab = "Total Number of Users", main = "Total Number of Users vs Windspeed")
dev.off()

png(filename = "graphs/registered-windspeed-scatterplot.png")
plot(train[["windspeed"]], train[["registered"]], xlab = "Windspeed", ylab = "Number of registered user rentals initiated", main = "Registered Users vs Windspeed")
dev.off()







