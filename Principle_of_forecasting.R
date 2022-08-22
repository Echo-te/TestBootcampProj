install.packages('fpp3')
library(tsibble)

#tsibble objects--- where time series data are stored 

y <- tsibble(
  Year = 2015:2019,
  Observation = c(123, 39, 78, 52, 110),
  index = Year
)

View(y)

library(dplyr)

y %>% 
  mutate(Month = yearmonth(Month)) %>%
  as_tsibble(index = Month)


prison <- read.csv("C:/Users/USER/Desktop/time-seriesProjects/prison_population.csv", 2L)

prison <- prison %>%
  mutate(Quarter = yearquarter(Date)) %>%
  select(-Date) %>%
  as_tsibble(key = c(State, Gender, Legal, Indigenous),
             index = Quarter)

View(prison)
