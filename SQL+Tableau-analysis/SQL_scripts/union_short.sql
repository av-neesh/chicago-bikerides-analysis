CREATE TABLE divvy_tripdata_2021
    SELECT *
	FROM (
		SELECT DISTINCT ride_id, rideable_type,
			EXTRACT(MONTH FROM started_at) AS month_of_year,
			WEEKDAY(started_at) AS day_of_week,
			started_at, ended_at, 
			TIMEDIFF(date_format(ended_at, '%H:%i:%s'), date_format(started_at, '%H:%i:%s'))  AS ride_length,
			start_station_name, start_station_id,  end_station_name, end_station_id,
			start_lat, start_lng, end_lat, end_lng,
			member_casual
		FROM (
			SELECT * FROM ( SELECT *
			FROM divvy_tripdata_202101
            LIMIT 30000) a
			UNION
			SELECT * FROM ( SELECT *
			FROM divvy_tripdata_202102
            LIMIT 30000) b
			UNION
			SELECT * FROM ( SELECT *
			FROM divvy_tripdata_202103
            LIMIT 30000) c
			UNION
			SELECT * FROM ( SELECT *
			FROM divvy_tripdata_202104
            LIMIT 30000) d
			UNION
			SELECT * FROM ( SELECT *
			FROM divvy_tripdata_202105
            LIMIT 30000) e
			UNION
			SELECT * FROM ( SELECT *
			FROM divvy_tripdata_202106
            LIMIT 30000) f
			UNION
			SELECT * FROM ( SELECT *
			FROM divvy_tripdata_202107
            LIMIT 30000) g
			UNION
			SELECT * FROM ( SELECT *
			FROM divvy_tripdata_202108
            LIMIT 30000) h
			UNION
			SELECT * FROM ( SELECT *
			FROM divvy_tripdata_202109
            LIMIT 30000) i
			UNION
			SELECT * FROM ( SELECT *
			FROM divvy_tripdata_202110
            LIMIT 30000) j
			UNION
			SELECT * FROM ( SELECT *
			FROM divvy_tripdata_202111
            LIMIT 30000) k
			UNION
			SELECT * FROM ( SELECT *
			FROM divvy_tripdata_202112
            LIMIT 30000) l
            ) union_table 
		) full_table ;