### US Inflation Rates with us_infl.csv

library(forecast)



                                                                                                                                                                                                                                                # Data import via scan
mydata = scan()
mydata

View(mydata)

# First exploratory plot
plot.ts(mydata)

#Converting to a time series
usinfl = ts(mydata, start = 2003, frequency = 12)
usinfl

#Time series plot with proper x axis
plot(usinfl)


#Seasonal Decomposition
decompose(usinfl)

#Visualization
plot(decompose(usinfl))


#STL decomposition
plot(stl(usinfl, s.window = 7))

# stl forecasting 
plot(stlf(usinfl, method = "ets" ))
?stlf

#Comparison with a standard ets forecast
plot(forecast(ets(usinfl), h = 24))
forecast(ets(usinfl, h = 24))

#Forecasts form ETS(A, N, A) additive seasonality , No trend, additive error


#Usin the autoplot
library(ggplot2)
autoplot(stlf(usinfl, method = "ets"))


# SEASONAL ARIMA
auto.arima(usinfl)
auto.arima(usinfl, stepwise = F, approximation = F, trace = T)

# Creating the object
usinflarima = auto.arima(usinfl,
                            stepwise = F,
                            approximation = F,
                            trace = T)
#Forecasting 
forec = forecast(usinflarima)

#Forecast plot
plot(forec)

# ARIMA(0, 1, 1)(0, 1, 1)(12) catch all model
usinflarima2 = Arima(usinfl, 
                     order = c(0, 1, 1),
                     seasonal = c(0, 1, 1))

#Forecast and Plot
forec = forecast(usinflarima2)
plot(forec)

# Holt Winters exponential smoothing
plot(hw(usinfl, h= 24))

#The default output of hw is h=24 forecast cycle

#Forecast of ets
plot(forecast(ets(usinfl), h=24))

# Monthplot
ggmonthplot(usinfl)

#Seasonplot
ggseasonplot(usinfl)







