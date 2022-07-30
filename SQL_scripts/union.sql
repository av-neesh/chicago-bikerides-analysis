CREATE TABLE divvy_tripdata_2021 (	
	ride_id VARCHAR(100),
    rideable_type VARCHAR(100),
    month_of_year INT,
    day_of_week INT,
    started_at DATETIME,
    ended_at DATETIME,
    ride_length TIME,
    start_station_name VARCHAR(100),
    start_station_id VARCHAR(100),
    end_station_name VARCHAR(100),
    end_station_id VARCHAR(100),
    start_lat DOUBLE,
    start_lng DOUBLE,
    end_lat DOUBLE,
    end_lng DOUBLE,
    member_casual VARCHAR(100) 
    )
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
			SELECT *
			FROM divvy_tripdata_202101
			UNION
			SELECT * 
			FROM divvy_tripdata_202102
			UNION
			SELECT *
			FROM divvy_tripdata_202103
			UNION
			SELECT * 
			FROM divvy_tripdata_202104
			UNION
			SELECT * 
			FROM divvy_tripdata_202105
			UNION
			SELECT * 
			FROM divvy_tripdata_202106
			UNION
			SELECT * 
			FROM divvy_tripdata_202107
			UNION
			SELECT * 
			FROM divvy_tripdata_202108
			UNION
			SELECT * 
			FROM divvy_tripdata_202109
			UNION
			SELECT * 
			FROM divvy_tripdata_202110
			UNION
			SELECT * 
			FROM divvy_tripdata_202111
			UNION
			SELECT * 
			FROM divvy_tripdata_202112
            ) union_table 
		) full_table ;