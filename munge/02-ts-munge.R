train[["datetime"]] <- as.POSIXct(strftime(train[["datetime"]], format = "%F %X"))
test[["datetime"]] <- as.POSIXct(strftime(test[["datetime"]], format = "%F %X"))

train <- transform(train, month_year = ordered(paste(strftime(datetime, format = "%y"), strftime(datetime, format = "%m"), sep = "-")), hour = as.numeric(strftime(datetime, format = "%H")), month = factor(strftime(train[["datetime"]], format = "%b"), levels = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"), ordered = TRUE))

test<- transform(test, month_year = ordered(paste(strftime(datetime, format = "%y"), strftime(datetime, format = "%m"), sep = "-")), hour = as.numeric(strftime(datetime, format = "%H")), month = factor(strftime(test[["datetime"]], format = "%b"), levels = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"), ordered = TRUE))

train$rush_hour <- ifelse(train[["workingday"]] == 1 & ((train$hour >= 6 & train$hour <= 9) | (train$hour >= 16 & train$hour <= 19)), 1, 0)
test$rush_hour <- ifelse(test[["workingday"]] == 1 & ((test$hour >= 6 & test$hour <= 9) | (test$hour >= 16 & test$hour <= 19)), 1, 0)