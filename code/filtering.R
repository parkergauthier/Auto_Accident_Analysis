#Loading necessary packages
library(dplyr)
library(here)
library(lubridate)

#Setting reproducable path
here::i_am("code/filtering.R")

#Reading in data
Accidents = read.csv(here("data/archive/US_Accidents_Dec21_updated.csv"))

#Lubridate and filter for 2021.  Also dropping variables that will not be used in this analysis to keep file size low.
Accidents$Start_Time = ymd_hms(Accidents$Start_Time)

Accidents_CO = Accidents %>% 
  filter(State == "CO") %>% 
  select(-End_Time, -End_Lat, -End_Lng, -Distance.mi.,-Description, -Number, -Side, -Country, -Airport_Code, -Weather_Timestamp, -Civil_Twilight, -Nautical_Twilight, -Astronomical_Twilight, -Wind_Direction)

#Save as new csv
write.csv(Accidents_CO, here("data/Moosavi_CO_2019.csv"))
