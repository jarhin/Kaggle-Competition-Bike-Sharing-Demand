library('ProjectTemplate')
load.project()

ggplot(data = transform(train, day = factor(strftime(train[["datetime"]], format = "%a"), levels = c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"), ordered = TRUE)), aes(x = day, y = casual)) + geom_boxplot() + stat_summary(geom = "point", fun.y = mean, colour = "blue") + ggtitle("Casual Users Vs Day of Week") 
ggsave(filename = "graphs/casual-vs-day-boxplot.png")

ggplot(data = transform(train, day = factor(strftime(train[["datetime"]], format = "%a"), levels = c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"), ordered = TRUE)), aes(x = day, y = casual)) + geom_boxplot() + stat_summary(geom = "point", fun.y = mean, colour = "blue") + ggtitle("Casual Users Vs Day of Week") + coord_cartesian(ylim = c(0, 100))
ggsave(filename = "graphs/casual-vs-day-boxplot-zoom.png")

ggplot(data = transform(train, day = factor(strftime(train[["datetime"]], format = "%a"), levels = c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"), ordered = TRUE)), aes(x = day, y = registered)) + geom_boxplot() + stat_summary(geom = "point", fun.y = mean, colour = "blue") + ggtitle("Registered Users Vs Day of Week")
ggsave(filename = "graphs/registered-vs-day-boxplot.png")

ggplot(data = transform(train, day = factor(strftime(train[["datetime"]], format = "%a"), levels = c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"), ordered = TRUE)), aes(x = day, y = registered)) + geom_boxplot() + stat_summary(geom = "point", fun.y = mean, colour = "blue") + ggtitle("Registered Users Vs Day of Week") + coord_cartesian(ylim = c(0, 250))
ggsave(filename = "graphs/registered-vs-day-boxplot-zoom.png")

ggplot(data = transform(train, day = factor(strftime(train[["datetime"]], format = "%a"), levels = c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"), ordered = TRUE)), aes(x = day, y = count)) + geom_boxplot() + stat_summary(geom = "point", fun.y = mean, colour = "blue") + ggtitle("Total Users Vs Day of Week")
ggsave(filename = "graphs/count-vs-day-boxplot.png")

ggplot(data = transform(train, day = factor(strftime(train[["datetime"]], format = "%a"), levels = c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"), ordered = TRUE)), aes(x = day, y = count)) + geom_boxplot() + stat_summary(geom = "point", fun.y = mean, colour = "blue") + ggtitle("Total Users Vs Day of Week") + coord_cartesian(ylim = c(0, 325))
ggsave(filename = "graphs/count-vs-day-boxplot-zoom.png")

ggplot(data = transform(train, month = factor(strftime(train[["datetime"]], format = "%b"), levels = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"), ordered = TRUE)), aes(x =  month, y = casual)) + geom_boxplot() + stat_summary(geom = "point", fun.y = mean, colour = "blue") + ggtitle("Casual Users Vs Month")
ggsave(filename = "graphs/casual-vs-month-boxplot.png")

ggplot(data = transform(train, month = factor(strftime(train[["datetime"]], format = "%b"), levels = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"), ordered = TRUE)), aes(x =  month, y = casual)) + geom_boxplot() + stat_summary(geom = "point", fun.y = mean, colour = "blue") + ggtitle("Casual Users Vs Month") + coord_cartesian(ylim = c(0,90))
ggsave(filename = "graphs/casual-vs-month-boxplot-zoom.png")

ggplot(data = transform(train, month = factor(strftime(train[["datetime"]], format = "%b"), levels = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"), ordered = TRUE)), aes(x =  month, y = registered)) + geom_boxplot() + stat_summary(geom = "point", fun.y = mean, colour = "blue") + ggtitle("Registered Users Vs Month")
ggsave(filename = "graphs/registered-vs-month-boxplot.png")

ggplot(data = transform(train, month = factor(strftime(train[["datetime"]], format = "%b"), levels = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"), ordered = TRUE)), aes(x =  month, y = registered)) + geom_boxplot() + stat_summary(geom = "point", fun.y = mean, colour = "blue") + ggtitle("Registered Users Vs Month") + coord_cartesian(ylim = c(0,300))
ggsave(filename = "graphs/registered-vs-month-boxplot-zoom.png")

ggplot(data = transform(train, month = factor(strftime(train[["datetime"]], format = "%b"), levels = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"), ordered = TRUE)), aes(x =  month, y = count)) + geom_boxplot() + stat_summary(geom = "point", fun.y = mean, colour = "blue") + ggtitle("Total Users Vs Month")
ggsave(filename = "graphs/count-vs-month-boxplot.png")

ggplot(data = transform(train, month = factor(strftime(train[["datetime"]], format = "%b"), levels = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"), ordered = TRUE)), aes(x =  month, y = count)) + geom_boxplot() + stat_summary(geom = "point", fun.y = mean, colour = "blue") + ggtitle("Total Users Vs Month") + coord_cartesian(ylim = c(0, 375))
ggsave(filename = "graphs/count-vs-month-boxplot-zoom.png")

ggplot(data = transform(train, month = factor(strftime(train[["datetime"]], format = "%b"), levels = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"), ordered = TRUE), day = factor(strftime(train[["datetime"]], format = "%a"), levels = c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"), ordered = TRUE)), aes(x = weather, y = count)) + geom_boxplot(alpha = 0.5) + facet_grid(month ~ day, scales = "free") + ggtitle("Total Users vs Day, Month & Weather Scatterplot")
ggsave(filename = "graphs/count-vs-day-month-weather.png")

ggplot(data = transform(train, hour = as.numeric(strftime(train[["datetime"]], format = "%H"))), aes(x = hour, y = casual)) + geom_point(alpha = 0.25) + ggtitle("Casual Users vs Hour")
ggsave(filename = "graphs/casual-hour-scatterplot.png")

ggplot(data = transform(train, hour = as.numeric(strftime(train[["datetime"]], format = "%H"))), aes(x = hour, y = count)) + geom_point(alpha = 0.25) + ggtitle("Total Users Vs Hour")
ggsave(filename = "graphs/count-hour-scatterplot.png")

ggplot(data = transform(train, hour = as.numeric(strftime(train[["datetime"]], format = "%H"))), aes(x = hour, y = registered)) + geom_point(alpha = 0.25) + ggtitle("Registered Users Vs Hour")
ggsave(filename = "graphs/registered-hour-scatterplot.png")

#http://stackoverflow.com/questions/5178813/ggplot2-legend-for-stat-summary

ggplot(data = train, aes(x = temp, y = casual)) + geom_point(alpha = 0.25, colour = "orange") + geom_line(stat = "summary", fun.y = mean, aes(colour = "mean")) + stat_summary(geom = "line", fun.y = quantile, probs = 0.10, aes(colour = "10%_quartile")) + stat_summary(geom = "line", fun.y = quantile, probs = 0.90, aes(colour = "90%_quartile")) + stat_summary(geom = "line", fun.y = median, aes(colour = "median")) + scale_color_manual("", values = c("mean" = "black", "10%_quartile" = "red", "90%_quartile" = "green", "median" = "blue")) + ggtitle("Casual Users vs Temperature")
ggsave("graphs/casual-temp-summary.png")

ggplot(data = train, aes(x = temp, y = registered)) + geom_point(alpha = 0.25, colour = "orange") + geom_line(stat = "summary", fun.y = mean, aes(colour = "mean")) + stat_summary(geom = "line", fun.y = quantile, probs = 0.10, aes(colour = "10%_quartile")) + stat_summary(geom = "line", fun.y = quantile, probs = 0.90, aes(colour = "90%_quartile")) + stat_summary(geom = "line", fun.y = median, aes(colour = "median")) + scale_color_manual("", values = c("mean" = "black", "10%_quartile" = "red", "90%_quartile" = "green", "median" = "blue")) + ggtitle("Registered Users vs Temperature")
ggsave("graphs/registered-temp-summary.png")

ggplot(data = train, aes(x = temp, y = count)) + geom_point(alpha = 0.25, colour = "orange") + geom_line(stat = "summary", fun.y = mean, aes(colour = "mean")) + stat_summary(geom = "line", fun.y = quantile, probs = 0.10, aes(colour = "10%_quartile")) + stat_summary(geom = "line", fun.y = quantile, probs = 0.90, aes(colour = "90%_quartile")) + stat_summary(geom = "line", fun.y = median, aes(colour = "median")) + scale_color_manual("", values = c("mean" = "black", "10%_quartile" = "red", "90%_quartile" = "green", "median" = "blue")) + ggtitle("Total Users vs Temperature")
ggsave("graphs/count-temp-summary.png")

ggplot(data = train, aes(x = humidity, y = casual)) + geom_point(alpha = 0.25, colour = "orange") + geom_line(stat = "summary", fun.y = mean, aes(colour = "mean")) + stat_summary(geom = "line", fun.y = quantile, probs = 0.10, aes(colour = "10%_quartile")) + stat_summary(geom = "line", fun.y = quantile, probs = 0.90, aes(colour = "90%_quartile")) + stat_summary(geom = "line", fun.y = median, aes(colour = "median")) + scale_color_manual("", values = c("mean" = "black", "10%_quartile" = "red", "90%_quartile" = "green", "median" = "blue")) + ggtitle("Casual Users vs Humidity")
ggsave("graphs/casual-humidity-summary.png")

ggplot(data = train, aes(x = humidity, y = registered)) + geom_point(alpha = 0.25, colour = "orange") + geom_line(stat = "summary", fun.y = mean, aes(colour = "mean")) + stat_summary(geom = "line", fun.y = quantile, probs = 0.10, aes(colour = "10%_quartile")) + stat_summary(geom = "line", fun.y = quantile, probs = 0.90, aes(colour = "90%_quartile")) + stat_summary(geom = "line", fun.y = median, aes(colour = "median")) + scale_color_manual("", values = c("mean" = "black", "10%_quartile" = "red", "90%_quartile" = "green", "median" = "blue")) + ggtitle("Registered Users vs Humidity")
ggsave("graphs/registered-humidity-summary.png")

ggplot(data = train, aes(x = humidity, y = count)) + geom_point(alpha = 0.25, colour = "orange") + geom_line(stat = "summary", fun.y = mean, aes(colour = "mean")) + stat_summary(geom = "line", fun.y = quantile, probs = 0.10, aes(colour = "10%_quartile")) + stat_summary(geom = "line", fun.y = quantile, probs = 0.90, aes(colour = "90%_quartile")) + stat_summary(geom = "line", fun.y = median, aes(colour = "median")) + scale_color_manual("", values = c("mean" = "black", "10%_quartile" = "red", "90%_quartile" = "green", "median" = "blue")) + ggtitle("Total Users vs Humidity")
ggsave("graphs/count-humidity-summary.png")

ggplot(data = train, aes(x = windspeed, y = casual)) + geom_point(alpha = 0.25, colour = "orange") + geom_line(stat = "summary", fun.y = mean, aes(colour = "mean")) + stat_summary(geom = "line", fun.y = quantile, probs = 0.10, aes(colour = "10%_quartile")) + stat_summary(geom = "line", fun.y = quantile, probs = 0.90, aes(colour = "90%_quartile")) + stat_summary(geom = "line", fun.y = median, aes(colour = "median")) + scale_color_manual("", values = c("mean" = "black", "10%_quartile" = "red", "90%_quartile" = "green", "median" = "blue")) + ggtitle("Casual Users vs Windspeed")
ggsave("graphs/casual-windspeed-summary.png")

ggplot(data = train, aes(x = windspeed, y = registered)) + geom_point(alpha = 0.25, colour = "orange") + geom_line(stat = "summary", fun.y = mean, aes(colour = "mean")) + stat_summary(geom = "line", fun.y = quantile, probs = 0.10, aes(colour = "10%_quartile")) + stat_summary(geom = "line", fun.y = quantile, probs = 0.90, aes(colour = "90%_quartile")) + stat_summary(geom = "line", fun.y = median, aes(colour = "median")) + scale_color_manual("", values = c("mean" = "black", "10%_quartile" = "red", "90%_quartile" = "green", "median" = "blue")) + ggtitle("Registered Users vs Windspeed")
ggsave("graphs/registered-windspeed-summary.png")

ggplot(data = train, aes(x = windspeed, y = count)) + geom_point(alpha = 0.25, colour = "orange") + geom_line(stat = "summary", fun.y = mean, aes(colour = "mean")) + stat_summary(geom = "line", fun.y = quantile, probs = 0.10, aes(colour = "10%_quartile")) + stat_summary(geom = "line", fun.y = quantile, probs = 0.90, aes(colour = "90%_quartile")) + stat_summary(geom = "line", fun.y = median, aes(colour = "median")) + scale_color_manual("", values = c("mean" = "black", "10%_quartile" = "red", "90%_quartile" = "green", "median" = "blue")) + ggtitle("Total Users vs Windspeed")
ggsave("graphs/count-windspeed-summary.png")

ggplot(data = transform(train, hour = as.numeric(strftime(train[["datetime"]], format = "%H"))), aes(x = hour, y = count)) + geom_point(alpha = 0.25, color = "orange") + ggtitle("Total Users Vs Hour & Working Day") + facet_wrap(~ workingday) + geom_line(stat = "summary", fun.y = mean, aes(colour = "mean")) + stat_summary(geom = "line", fun.y = quantile, probs = 0.10, aes(colour = "10%_quartile")) + stat_summary(geom = "line", fun.y = quantile, probs = 0.90, aes(colour = "90%_quartile")) + stat_summary(geom = "line", fun.y = median, aes(colour = "median")) + scale_color_manual("", values = c("mean" = "black", "10%_quartile" = "red", "90%_quartile" = "green", "median" = "blue"))
ggsave(filename = "graphs/count-hour-workingday-scatterplot.png")

ggplot(data = transform(train, hour = as.numeric(strftime(train[["datetime"]], format = "%H"))), aes(x = hour, y = casual)) + geom_point(alpha = 0.25, color = "orange") + ggtitle("Casual Users vs Hour & Working Day") + facet_wrap(~ workingday) + geom_line(stat = "summary", fun.y = mean, aes(colour = "mean")) + stat_summary(geom = "line", fun.y = quantile, probs = 0.10, aes(colour = "10%_quartile")) + stat_summary(geom = "line", fun.y = quantile, probs = 0.90, aes(colour = "90%_quartile")) + stat_summary(geom = "line", fun.y = median, aes(colour = "median")) + scale_color_manual("", values = c("mean" = "black", "10%_quartile" = "red", "90%_quartile" = "green", "median" = "blue"))
ggsave(filename = "graphs/casual-hour-workingday-scatterplot.png")

ggplot(data = transform(train, hour = as.numeric(strftime(train[["datetime"]], format = "%H"))), aes(x = hour, y = registered)) + geom_point(alpha = 0.25, color = "orange") + ggtitle("Registered Users Vs Hour & Working Day") + facet_wrap(~ workingday) + geom_line(stat = "summary", fun.y = mean, aes(colour = "mean")) + stat_summary(geom = "line", fun.y = quantile, probs = 0.10, aes(colour = "10%_quartile")) + stat_summary(geom = "line", fun.y = quantile, probs = 0.90, aes(colour = "90%_quartile")) + stat_summary(geom = "line", fun.y = median, aes(colour = "median")) + scale_color_manual("", values = c("mean" = "black", "10%_quartile" = "red", "90%_quartile" = "green", "median" = "blue"))
ggsave(filename = "graphs/registered-hour-workingday-scatterplot.png")


