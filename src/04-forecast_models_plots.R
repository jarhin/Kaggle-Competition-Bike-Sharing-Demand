library('ProjectTemplate')
load.project()


submission_fitted <- data.frame(datetime = character(), count = numeric(), stringsAsFactors=FALSE)

month_year_all <- levels(train[["month_year"]])
for(fixed in month_year_all)
{
  sset <- train[train$month_year == fixed,]
  tsset <- test[test$month_year == fixed,]

  #24 * 7 = 168 observations a week
  reg <- xts(sset[["registered"]], sset[["datetime"]])
  reg <- msts(reg, seasonal.periods=c(24, 168))
  cas <- xts(sset[["casual"]], sset[["datetime"]])
  cas <- msts(cas, seasonal.periods=c(24, 168))

  #we get first few fourier terms for both time series (seasonality)
  #we adjust the time series to make forward predictions for a week.
  forcast_num <- dim(tsset)[1]


  reg_ts <- ts(reg, frequency = 24)
  reg_daily <- fourier(reg_ts, K = 5)
  reg_weekly <- fourier(ts(reg_ts, frequency = 24 * 7), K = 5)
  reg_daily_f <- fourierf(reg_ts, K = 5, h = forcast_num)
  reg_weekly_f <- fourierf(ts(reg_ts, frequency = 24 * 7), K = 5, h = forcast_num)

  cas_ts <- ts(cas, frequency = 24)
  cas_daily <- fourier(cas_ts, K = 5)
  cas_weekly <- fourier(ts(cas_ts, frequency = 24 * 7), K = 5)
  cas_daily_f <- fourierf(cas_ts, K = 5, h = forcast_num)
  cas_weekly_f <- fourierf(ts(cas_ts, frequency = 24 * 7), K = 5, h = forcast_num)

  #
  #fits essentially a linear model with a certain error structure
  fit_reg <- try(auto.arima(reg, xreg=cbind(reg_daily,reg_weekly, sset$hour, sset$rush_hour, sset$workingday, sset$holiday, sset$weather, sset$atemp, sset$windspeed, sset$humidity), seasonal=TRUE, approximation=FALSE,trace=FALSE))
  fit_cas <- try(auto.arima(cas, xreg=cbind(cas_daily, cas_weekly, sset$hour, sset$rush_hour, sset$workingday, sset$holiday, sset$weather, sset$atemp, sset$windspeed, sset$humidity), seasonal=TRUE, approximation=FALSE,trace=FALSE))

  if(class(fit_reg) == "try-error")
  {
    fit_reg <- try(auto.arima(reg, xreg=cbind(reg_daily,reg_weekly, sset$hour, sset$rush_hour, sset$workingday, sset$holiday, sset$weather, sset$atemp, sset$windspeed, sset$humidity), seasonal=FALSE, approximation=FALSE,trace=FALSE))
  } 

  if(class(fit_cas) == "try-error")
  {
    fit_cas <- try(auto.arima(cas, xreg=cbind(cas_daily, cas_weekly, sset$hour, sset$rush_hour, sset$workingday, sset$holiday, sset$weather, sset$atemp, sset$windspeed, sset$humidity), seasonal=FALSE, approximation=FALSE,trace=FALSE))
  } 
  
   if(class(fit_reg) == "try-error")
  {
    fit_reg <- try(auto.arima(reg, xreg=cbind(sset$hour, sset$rush_hour, sset$workingday, sset$holiday, sset$weather, sset$atemp, sset$windspeed, sset$humidity), seasonal=FALSE, approximation=FALSE,trace=FALSE))
    fc_reg <- forecast(fit_reg, xreg = cbind(tsset$hour, tsset$rush_hour, tsset$workingday, tsset$holiday, tsset$weather, tsset$atemp, tsset$windspeed, tsset$humidity), h = forcast_num)
  } else 
  {
    fc_reg <- forecast(fit_reg, xreg = cbind(reg_daily_f, reg_weekly_f, tsset$hour, tsset$rush_hour, tsset$workingday, tsset$holiday, tsset$weather, tsset$atemp, tsset$windspeed, tsset$humidity), h = forcast_num)
  }

  if(class(fit_cas) == "try-error")
  {
    fit_cas <- try(auto.arima(cas, xreg=cbind(sset$hour, sset$rush_hour, sset$workingday, sset$holiday, sset$weather, sset$atemp, sset$windspeed, sset$humidity), seasonal=FALSE, approximation=FALSE,trace=FALSE))
    fc_cas <- forecast(fit_cas, xreg = cbind(tsset$hour, tsset$rush_hour, tsset$workingday, tsset$holiday, tsset$weather, tsset$atemp, tsset$windspeed, tsset$humidity), h = forcast_num)
  } else 
  {
    fc_cas <- forecast(fit_cas, xreg = cbind(cas_daily_f, cas_weekly_f, tsset$hour, tsset$rush_hour, tsset$workingday, tsset$holiday, tsset$weather, tsset$atemp, tsset$windspeed, tsset$humidity), h = forcast_num)
  }

  fc_reg_value <- ifelse(fc_reg[["mean"]] > 0, fc_reg[["mean"]], 0)
  fc_cas_value <- ifelse(fc_cas[["mean"]] > 0, fc_cas[["mean"]], 0)

  fc_count <- round(fc_reg_value + fc_cas_value)
  temp <- data.frame(datetime = strftime(tsset[["datetime"]], format = "%F %X"), count = as.vector(fc_count))

  plot_df <- data.frame(datetime = sset[["datetime"]], count = sset[["count"]], casual = sset[["casual"]], registered = sset[["registered"]], casual_fitted = as.vector(fc_cas[["fitted"]]), registered_fitted = as.vector(fc_reg[["fitted"]]), count_fitted = as.vector(fc_cas[["fitted"]] + fc_reg[["fitted"]])) 

  string_level <- as.character(fixed)
  graph <- "-counts-fitted.png"
  filename_plot <- paste0("graphs/", string_level, graph)
  plot_df_sub <- subset(plot_df, select = c(datetime, count, count_fitted))
  ggplot(data = melt(plot_df_sub, id.vars = "datetime"), aes(x = datetime, y = value, color = variable)) + geom_line() + ylab("Total Number of Customers") + xlab("Date") + ggtitle("Count vs Fitted Count Values")
  ggsave(filename = filename_plot)

  graph <- "-casual-fitted.png"
  filename_plot <- paste0("graphs/", string_level, graph)
  plot_df_sub <- subset(plot_df, select = c(datetime, casual, casual_fitted))
  ggplot(data = melt(plot_df_sub, id.vars = "datetime"), aes(x = datetime, y = value, color = variable)) + geom_line() + ylab("Number of Non-registered Customers") + xlab("Date") + ggtitle("Casual vs Fitted Casual Values")
  ggsave(filename = filename_plot)

  graph <- "-registered-fitted.png"
  filename_plot <- paste0("graphs/", string_level, graph)
  plot_df_sub <- subset(plot_df, select = c(datetime, registered, registered_fitted))
  ggplot(data = melt(plot_df_sub, id.vars = "datetime"), aes(x = datetime, y = value, color = variable)) + geom_line() + ylab("Number of registered Customers") + xlab("Date") + ggtitle("Registered vs Fitted Registered Values")
  ggsave(filename = filename_plot)

  submission_fitted <- rbind(submission_fitted, temp)
}

submission_fitted <- submission_fitted[!duplicated(submission_fitted$datetime),]
submission_fitted <- submission_fitted[order(submission_fitted),]


datetime_sub <- data.frame(datetime = sampleSubmission[["datetime"]])

submission <- join(submission_fitted, datetime_sub, type = "right")
submission_missing <- which(is.na(submission[["count"]]))
submission[submission_missing, "count"] <- submission[submission_missing - 1, "count"]
#submission <- submission[!duplicated(submission$datetime),]

write.csv(submission, file = "submission.csv", row.names = FALSE)




