#Project Trending Data- Spain LFPR
library(forecast)

spain_labourforce <- read.csv("C:/Users/USER/Desktop/time-seriesProjects/03/demos/spain_lfpr.csv", 2L)

head(spain_labourforce, 4)
View(spain_labourforce)

spain = ts(spain_labourforce$x, start = 1980)

plot(spain, ylab = "Labor Force Participation Rate 25-54")


#Exponential smoothing with holt

#The biggest problem here is that it is a rate, Labour force participation cannot be higher than 100%
#Therefore, there needs to be some threshold for a linear trend following method
#Otherwise the model would go to infinity
#The Holt method has a damping parameter for that scenario. With the parameter, it should control for this problem

holttrend = holt(spain, h= 5) #h determines the forecast length
summary(holttrend)
plot(holttrend)


#The confidence interval is between 80% and 95%
#We can see that the slop of the forecasted period is nearly the same as the period between 1998 and 2007
# This model assumes that the trend of this dataset will continue uninterrupted and unchanged till the future

# l= level b= slope these values are used together with the smoothing parameters in the initial level and slope
#equation to calculate the first forecasted information


#Let's take congnizance of the damping in our model
#phi auto generaed
plot(holt(spain, h=15, damped = T))
#The curve is still not sufficiently flattened out, it will take some more years to reach to total flattened stage
#This is a hint of a phi clost to 1

#Let's extract our phi
summary(holt(spain, h= 15, damped= T))

#Let's set the phi to learn how the curve react to lower phi
plot(holt(spain, h = 15, damped = T, phi = 0.8))

#Generally speaking it is advisable to use phi R proveide us with
#But some scientific field have standard parameter setting in their field


#ARIMA MODEL
#ARIMA auto generated
spainarima = auto.arima(spain,
                        stepwise = F,
                        approximation = F)
summary(spainarima)

#The dataset needs to univariate time series

plot(forecast(spainarima, h=5))

#The standart R-based plot of the forecast
#We have the forecast in blue, including 80 and 90% prediction interval
#This plot clearly exemplifies that an ARIMA model is a linear endeavor. There is no damping going on
# and since we have no seasonal patterns or other forms of cycle,
#The model uses the trend from the dataset and projects it I would be skeptical of that model due to the nature of the dataset


# Model Comparison
holttrend = holt(spain, h= 10)
holtdamped = holt(spain, h= 10, damped = T, phi= 0.8)
arimafore = forecast(spainarima, h= 10)

library(ggplot2)
# 3 Forecast lines as comparison
autoplot(spain) +
  forecast::autolayer(holttrend$mean, series = "Hot Linear Trend") +
  forecast::autolayer(holtdamped$mean, series = "Hot Damped Trend") +
  forecast::autolayer(arimafore$mean, series = "ARIMA") +
  
  xlab("year") + 
  ylab("Labour Force Participation Rate Age 25-54") +
  guides(colour = guide_legend(title = "Forecast Method")) +
  theme(legend.position = c(0.8, 0.2)) +
  ggtitle("Spain") +
  theme(plot.title = element_text(family = "Times, hjust = 0.5",
                                  color = "blue", face = "bold", size = 15))











