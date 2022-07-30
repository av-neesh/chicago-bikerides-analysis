UPDATE divvy_tripdata_2021
SET ride_length= IF(ride_length<0, sec_to_time(time_to_sec(ride_length)+86400),ride_length)
WHERE ride_id IS NOT NULL;