tripdata_2021 <- drop_na(tripdata_2021, ride_id, started_at, ended_at, member_casual)

library(lubridate)
tripdata_2021$month <- format(as.Date(tripdata_2021$started_at), "%B")
tripdata_2021$day_of_week <- format(as.Date(tripdata_2021$started_at), "%A")

tripdata_2021 <- tripdata_2021 %>% mutate(ride_length = difftime(ended_at,started_at))
tripdata_2021$ride_length <- hms::hms(seconds_to_period(tripdata_2021$ride_length))

tripdata_2021 <- tripdata_2021[!(as.numeric(tripdata_2021$ride_length) < 0),]

install.packages("geosphere")
library(geosphere)
tripdata_2021$ride_distance <- distGeo(matrix(c(tripdata_2021$start_lng, tripdata_2021$start_lat), ncol = 2), matrix(c(tripdata_2021$end_lng, tripdata_2021$end_lat), ncol = 2))
tripdata_2021$ride_distance <- tripdata_2021$ride_distance/1000

tripdata_2021$ride_speed <- (tripdata_2021$ride_distance)/(as.numeric((tripdata_2021$ride_length), units="hours"))

glimpse(tripdata_2021)
