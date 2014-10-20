# Example preprocessing script.

#We comvert date time to actual datetime
train[["datetime"]] <- strftime(train[["datetime"]], format = "%F %X")
test[["datetime"]] <- strftime(test[["datetime"]], format = "%F %X")

#convert season to a factor
train[["season"]] <- as.factor(train[["season"]])
test[["season"]] <- as.factor(test[["season"]])

#convert holiday to a factor
train[["holiday"]] <- as.factor(train[["holiday"]])
test[["holiday"]] <- as.factor(test[["holiday"]])

#convert workingday to a factor
train[["holiday"]] <- as.factor(train[["holiday"]])
test[["holiday"]] <- as.factor(test[["holiday"]])

#convert weather to a factor
train[["weather"]] <- as.factor(train[["weather"]])
test[["weather"]] <- as.factor(test[["weather"]])