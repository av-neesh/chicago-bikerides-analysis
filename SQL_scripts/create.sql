CREATE TABLE divvy_tripdata_202101 (
	ride_id VARCHAR(100), rideable_type VARCHAR(100),
    started_at DATETIME, ended_at DATETIME,
    start_station_name VARCHAR(100), start_station_id VARCHAR(100),
    end_station_name VARCHAR(100), end_station_id VARCHAR(100),
    start_lat DOUBLE, start_lng DOUBLE,
    end_lat DOUBLE, end_lng DOUBLE,
    member_casual VARCHAR(100) );
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/202101-divvy-tripdata.csv' INTO TABLE divvy_tripdata_202101
FIELDS TERMINATED BY ','
IGNORE 1 LINES 
(ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, @vstart_lat, @start_lng, @vend_lat, @vend_lng, member_casual)
SET start_lat= NULLIF(@vstart_lat,''),
	start_lng= NULLIF(@start_lng,''),
    end_lat= NULLIF(@vend_lat,''),
    end_lng= NULLIF(@vend_lng,'') ;
    
CREATE TABLE divvy_tripdata_202102 (
	ride_id VARCHAR(100), rideable_type VARCHAR(100),
    started_at DATETIME, ended_at DATETIME,
    start_station_name VARCHAR(100), start_station_id VARCHAR(100),
    end_station_name VARCHAR(100), end_station_id VARCHAR(100),
    start_lat DOUBLE, start_lng DOUBLE,
    end_lat DOUBLE, end_lng DOUBLE,
    member_casual VARCHAR(100) );
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/202102-divvy-tripdata.csv' INTO TABLE divvy_tripdata_202102
FIELDS TERMINATED BY ','
IGNORE 1 LINES 
(ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, @vstart_lat, @start_lng, @vend_lat, @vend_lng, member_casual)
SET start_lat= NULLIF(@vstart_lat,''),
	start_lng= NULLIF(@start_lng,''),
    end_lat= NULLIF(@vend_lat,''),
    end_lng= NULLIF(@vend_lng,'') ;
    
CREATE TABLE divvy_tripdata_202103 (
	ride_id VARCHAR(100), rideable_type VARCHAR(100),
    started_at DATETIME, ended_at DATETIME,
    start_station_name VARCHAR(100), start_station_id VARCHAR(100),
    end_station_name VARCHAR(100), end_station_id VARCHAR(100),
    start_lat DOUBLE, start_lng DOUBLE,
    end_lat DOUBLE, end_lng DOUBLE,
    member_casual VARCHAR(100) );
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/202103-divvy-tripdata.csv' INTO TABLE divvy_tripdata_202103
FIELDS TERMINATED BY ','
IGNORE 1 LINES 
(ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, @vstart_lat, @start_lng, @vend_lat, @vend_lng, member_casual)
SET start_lat= NULLIF(@vstart_lat,''),
	start_lng= NULLIF(@start_lng,''),
    end_lat= NULLIF(@vend_lat,''),
    end_lng= NULLIF(@vend_lng,'') ;
    
CREATE TABLE divvy_tripdata_202104 (
	ride_id VARCHAR(100), rideable_type VARCHAR(100),
    started_at DATETIME, ended_at DATETIME,
    start_station_name VARCHAR(100), start_station_id VARCHAR(100),
    end_station_name VARCHAR(100), end_station_id VARCHAR(100),
    start_lat DOUBLE, start_lng DOUBLE,
    end_lat DOUBLE, end_lng DOUBLE,
    member_casual VARCHAR(100) );
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/202104-divvy-tripdata.csv' INTO TABLE divvy_tripdata_202104
FIELDS TERMINATED BY ','
IGNORE 1 LINES 
(ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, @vstart_lat, @start_lng, @vend_lat, @vend_lng, member_casual)
SET start_lat= NULLIF(@vstart_lat,''),
	start_lng= NULLIF(@start_lng,''),
    end_lat= NULLIF(@vend_lat,''),
    end_lng= NULLIF(@vend_lng,'') ;
    
CREATE TABLE divvy_tripdata_202105 (
	ride_id VARCHAR(100), rideable_type VARCHAR(100),
    started_at DATETIME, ended_at DATETIME,
    start_station_name VARCHAR(100), start_station_id VARCHAR(100),
    end_station_name VARCHAR(100), end_station_id VARCHAR(100),
    start_lat DOUBLE, start_lng DOUBLE,
    end_lat DOUBLE, end_lng DOUBLE,
    member_casual VARCHAR(100) );
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/202105-divvy-tripdata.csv' INTO TABLE divvy_tripdata_202105
FIELDS TERMINATED BY ','
IGNORE 1 LINES 
(ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, @vstart_lat, @start_lng, @vend_lat, @vend_lng, member_casual)
SET start_lat= NULLIF(@vstart_lat,''),
	start_lng= NULLIF(@start_lng,''),
    end_lat= NULLIF(@vend_lat,''),
    end_lng= NULLIF(@vend_lng,'') ;
    
CREATE TABLE divvy_tripdata_202106 (
	ride_id VARCHAR(100), rideable_type VARCHAR(100),
    started_at DATETIME, ended_at DATETIME,
    start_station_name VARCHAR(100), start_station_id VARCHAR(100),
    end_station_name VARCHAR(100), end_station_id VARCHAR(100),
    start_lat DOUBLE, start_lng DOUBLE,
    end_lat DOUBLE, end_lng DOUBLE,
    member_casual VARCHAR(100) );
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/202106-divvy-tripdata.csv' INTO TABLE divvy_tripdata_202106
FIELDS TERMINATED BY ','
IGNORE 1 LINES 
(ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, @vstart_lat, @start_lng, @vend_lat, @vend_lng, member_casual)
SET start_lat= NULLIF(@vstart_lat,''),
	start_lng= NULLIF(@start_lng,''),
    end_lat= NULLIF(@vend_lat,''),
    end_lng= NULLIF(@vend_lng,'') ;
    
CREATE TABLE divvy_tripdata_202107 (
	ride_id VARCHAR(100), rideable_type VARCHAR(100),
    started_at DATETIME, ended_at DATETIME,
    start_station_name VARCHAR(100), start_station_id VARCHAR(100),
    end_station_name VARCHAR(100), end_station_id VARCHAR(100),
    start_lat DOUBLE, start_lng DOUBLE,
    end_lat DOUBLE, end_lng DOUBLE,
    member_casual VARCHAR(100) );
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/202107-divvy-tripdata.csv' INTO TABLE divvy_tripdata_202107
FIELDS TERMINATED BY ','
IGNORE 1 LINES 
(ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, @vstart_lat, @start_lng, @vend_lat, @vend_lng, member_casual)
SET start_lat= NULLIF(@vstart_lat,''),
	start_lng= NULLIF(@start_lng,''),
    end_lat= NULLIF(@vend_lat,''),
    end_lng= NULLIF(@vend_lng,'') ;
    
CREATE TABLE divvy_tripdata_202108 (
	ride_id VARCHAR(100), rideable_type VARCHAR(100),
    started_at DATETIME, ended_at DATETIME,
    start_station_name VARCHAR(100), start_station_id VARCHAR(100),
    end_station_name VARCHAR(100), end_station_id VARCHAR(100),
    start_lat DOUBLE, start_lng DOUBLE,
    end_lat DOUBLE, end_lng DOUBLE,
    member_casual VARCHAR(100) );
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/202108-divvy-tripdata.csv' INTO TABLE divvy_tripdata_202108
FIELDS TERMINATED BY ','
IGNORE 1 LINES 
(ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, @vstart_lat, @start_lng, @vend_lat, @vend_lng, member_casual)
SET start_lat= NULLIF(@vstart_lat,''),
	start_lng= NULLIF(@start_lng,''),
    end_lat= NULLIF(@vend_lat,''),
    end_lng= NULLIF(@vend_lng,'') ;

CREATE TABLE divvy_tripdata_202109 (
	ride_id VARCHAR(100), rideable_type VARCHAR(100),
    started_at DATETIME, ended_at DATETIME,
    start_station_name VARCHAR(100), start_station_id VARCHAR(100),
    end_station_name VARCHAR(100), end_station_id VARCHAR(100),
    start_lat DOUBLE, start_lng DOUBLE,
    end_lat DOUBLE, end_lng DOUBLE,
    member_casual VARCHAR(100) );
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/202109-divvy-tripdata.csv' INTO TABLE divvy_tripdata_202109
FIELDS TERMINATED BY ','
IGNORE 1 LINES 
(ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, @vstart_lat, @start_lng, @vend_lat, @vend_lng, member_casual)
SET start_lat= NULLIF(@vstart_lat,''),
	start_lng= NULLIF(@start_lng,''),
    end_lat= NULLIF(@vend_lat,''),
    end_lng= NULLIF(@vend_lng,'') ;
    
CREATE TABLE divvy_tripdata_202110 (
	ride_id VARCHAR(100), rideable_type VARCHAR(100),
    started_at DATETIME, ended_at DATETIME,
    start_station_name VARCHAR(100), start_station_id VARCHAR(100),
    end_station_name VARCHAR(100), end_station_id VARCHAR(100),
    start_lat DOUBLE, start_lng DOUBLE,
    end_lat DOUBLE, end_lng DOUBLE,
    member_casual VARCHAR(100) );
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/202110-divvy-tripdata.csv' INTO TABLE divvy_tripdata_202110
FIELDS TERMINATED BY ','
IGNORE 1 LINES 
(ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, @vstart_lat, @start_lng, @vend_lat, @vend_lng, member_casual)
SET start_lat= NULLIF(@vstart_lat,''),
	start_lng= NULLIF(@start_lng,''),
    end_lat= NULLIF(@vend_lat,''),
    end_lng= NULLIF(@vend_lng,'') ;
    
CREATE TABLE divvy_tripdata_202111 (
	ride_id VARCHAR(100), rideable_type VARCHAR(100),
    started_at DATETIME, ended_at DATETIME,
    start_station_name VARCHAR(100), start_station_id VARCHAR(100),
    end_station_name VARCHAR(100), end_station_id VARCHAR(100),
    start_lat DOUBLE, start_lng DOUBLE,
    end_lat DOUBLE, end_lng DOUBLE,
    member_casual VARCHAR(100) );
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/202111-divvy-tripdata.csv' INTO TABLE divvy_tripdata_202111
FIELDS TERMINATED BY ','
IGNORE 1 LINES 
(ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, @vstart_lat, @start_lng, @vend_lat, @vend_lng, member_casual)
SET start_lat= NULLIF(@vstart_lat,''),
	start_lng= NULLIF(@start_lng,''),
    end_lat= NULLIF(@vend_lat,''),
    end_lng= NULLIF(@vend_lng,'') ;
    
CREATE TABLE divvy_tripdata_202112 (
	ride_id VARCHAR(100), rideable_type VARCHAR(100),
    started_at DATETIME, ended_at DATETIME,
    start_station_name VARCHAR(100), start_station_id VARCHAR(100),
    end_station_name VARCHAR(100), end_station_id VARCHAR(100),
    start_lat DOUBLE, start_lng DOUBLE,
    end_lat DOUBLE, end_lng DOUBLE,
    member_casual VARCHAR(100) );
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/202112-divvy-tripdata.csv' INTO TABLE divvy_tripdata_202112
FIELDS TERMINATED BY ','
IGNORE 1 LINES 
(ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, @vstart_lat, @start_lng, @vend_lat, @vend_lng, member_casual)
SET start_lat= NULLIF(@vstart_lat,''),
	start_lng= NULLIF(@start_lng,''),
    end_lat= NULLIF(@vend_lat,''),
    end_lng= NULLIF(@vend_lng,'') ;