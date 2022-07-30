/* Viz1 */
SELECT month_of_year, member_casual,
	COUNT(ride_id) AS no_of_trips,
        sec_to_time(AVG(ride_length)) AS avg_ride_length
FROM divvy_tripdata_2021
GROUP BY member_casual, month_of_year;



/* Viz2 */
SELECT day_of_week, member_casual,
        COUNT(ride_id) AS ride_cnt,
	sec_to_time(AVG(ride_length)) AS avg_ride_lengthh
FROM divvy_tripdata_2021
GROUP BY day_of_week, member_casual;



/* Viz3 */
SELECT ride_id, member_casual, start_lat, start_lng, end_lat, end_lng
FROM divvy_tripdata_2021
WHERE start_lat IS NOT NULL AND start_lng IS NOT NULL AND end_lat IS NOT NULL AND end_lng IS NOT NULL
ORDER BY sqrt((start_lat-end_lat)*(start_lat-end_lat)-(start_lng-end_lng)*(start_lng-end_lng)) DESC;



/* SQL1 */
SELECT COUNT(ride_id) AS ride_count, sec_to_time(AVG(ride_length)) AS avg_ride_l, member_casual, CONCAT(start_station_name, " to ", end_station_name) AS route
FROM divvy_tripdata_2021
GROUP BY member_casual, route
ORDER BY ride_count DESC, member_casual
LIMIT 10;

SELECT COUNT(ride_id) AS ride_count, sec_to_time(AVG(ride_length)) AS avg_ride_l, member_casual, CONCAT(start_station_name, " to ", end_station_name) AS route
FROM divvy_tripdata_2021
WHERE member_casual LIKE '%member%'
GROUP BY route
ORDER BY ride_count DESC
LIMIT 10;

SELECT COUNT(ride_id) AS ride_count, sec_to_time(AVG(ride_length)) AS avg_ride_l, member_casual, CONCAT(start_station_name, " to ", end_station_name) AS route
FROM divvy_tripdata_2021
WHERE member_casual LIKE '%casual%'
GROUP BY route
ORDER BY ride_count DESC
LIMIT 10;



/* Viz4 */
SELECT COUNT(ride_id) AS ride_count, sec_to_time(AVG(ride_length)) AS avg_ride_l, member_casual, CONCAT(start_station_name, " to ", end_station_name) AS route
FROM divvy_tripdata_2021
GROUP BY route
ORDER BY ride_count DESC
LIMIT 100;



/* Viz5 */
SELECT ride_id, member_casual, start_lat, start_lng, end_lat, end_lng
FROM divvy_tripdata_2021
WHERE member_casual LIKE '%casual%' AND start_lat IS NOT NULL AND start_lng IS NOT NULL AND end_lat IS NOT NULL AND end_lng IS NOT NULL AND start_lat != end_lat AND start_lng != end_lng
ORDER BY sqrt((end_lat-start_lat)*(end_lat-start_lat)-(end_lng-start_lng)*(end_lng-start_lng)) DESC
LIMIT 250;

SELECT ride_id, member_casual, start_lat, start_lng, end_lat, end_lng
FROM divvy_tripdata_2021
WHERE member_casual LIKE '%member%' AND start_lat IS NOT NULL AND start_lng IS NOT NULL AND end_lat IS NOT NULL AND end_lng IS NOT NULL AND start_lat != end_lat AND start_lng != end_lng
ORDER BY sqrt((end_lat-start_lat)*(end_lat-start_lat)-(end_lng-start_lng)*(end_lng-start_lng)) DESC
LIMIT 250;