
USE cyclistic;



-- Merge 12 Tables to a new table --
SELECT COUNT(*) AS row_count
FROM tripdata_2022;
SELECT * 
INTO tripdata_2022
FROM tripdata_202201
UNION
SELECT *
FROM tripdata_202202
UNION
SELECT *
FROM tripdata_202203
UNION
SELECT *
FROM tripdata_202204
UNION
SELECT *
FROM tripdata_202205
UNION
SELECT *
FROM tripdata_202206
UNION
SELECT *
FROM tripdata_202207
UNION
SELECT *
FROM tripdata_202208
UNION
SELECT *
FROM tripdata_202209
UNION
SELECT *
FROM tripdata_202210
UNION
SELECT *
FROM tripdata_202211
UNION
SELECT *
FROM tripdata_202212;



-- Identify and Remove null values --

WITH RowsToDelete AS (
  SELECT * 
  FROM 
      tripdata_2022
  WHERE 
      ride_id IS NULL
      OR rideable_type IS NULL
      OR started_at IS NULL
      OR ended_at  IS NULL 
      OR start_station_name IS NULL
      OR start_station_id IS NULL
      OR end_station_name IS NULL
      OR end_station_id IS NULL
      OR start_lat IS NULL
      OR start_lng IS NULL
      OR end_lat IS NULL
      OR end_lng IS NULL
      OR member_casual IS NULL
)
DELETE FROM RowsToDelete;



-- Identify and remove duplicate values --

WITH DuplicateRows AS (
    SELECT
        ride_id,
        ROW_NUMBER() OVER (PARTITION BY ride_id ORDER BY (SELECT NULL)) AS RowNum
    FROM tripdata_2022
)
DELETE FROM 
    DuplicateRows 
WHERE 
    RowNum > 1;




-- Identify and remove spaces before and after values --
UPDATE dbo.tripdata_2022
SET 
ride_id = LTRIM(RTRIM(ride_id)),
rideable_type = LTRIM(RTRIM(rideable_type)),
ended_at = LTRIM(RTRIM(ended_at)),
start_station_name = LTRIM(RTRIM(start_station_name)),
start_station_id = LTRIM(RTRIM(start_station_id)),
end_station_name = LTRIM(RTRIM(end_station_name)),
end_station_id = LTRIM(RTRIM(end_station_id)),
start_lat = LTRIM(RTRIM(start_lat)),
start_lng = LTRIM(RTRIM(start_lng)),
end_lat = LTRIM(RTRIM(end_lat)),
end_lng = LTRIM(RTRIM(end_lng)),
member_casual = LTRIM(RTRIM(member_casual));




-- Identify and remove rows where the start time is later than the end time. --

WITH Wrongtime AS (
    SELECT *
    FROM 
        tripdata_2022
    WHERE 
        started_at > ended_at
)
DELETE FROM Wrongtime;
  

--Identify and remove trip times that over 1 day --

WITH OverOneDayTrip AS(
    SELECT *
    FROM 
        tripdata_2022
    WHERE 
	    DATEDIFF(DAY,started_at, ended_at) > 1
)

DELETE FROM OverOneDayTrip;


-- Identify and remove trip times that less than 1 minute --

WITH LessOneMinuteTrip AS(
    SELECT *
    FROM 
	    tripdata_2022
    WHERE 
	    DATEDIFF(MINUTE,started_at, ended_at) < 1
)

DELETE FROM LessOneMinuteTrip;








          -- Analysis PHASE --

-- Create a column with the calculated ride duration in minutes --

ALTER TABLE tripdata_2022
ADD ride_duration_minutes INT;

UPDATE tripdata_2022
SET ride_duration_minutes = DATEDIFF(MINUTE, started_at, ended_at);



 -- Create a column with the weekdays --

ALTER TABLE tripdata_2022
ADD weekday_name INT;
SET DATEFIRST 1;
UPDATE tripdata_2022
SET weekday_name =DATEPART(WEEKDAY, started_at);



 -- Create a column with the months --

 ALTER TABLE tripdata_2022
 ADD month_name INT;

 UPDATE tripdata_2022
 SET month_name = DATEPART(MONTH, started_at);



 -- Add hour_of_day column --
ALTER TABLE tripdata_2022
ADD hour_of_day INT;



-- Populate hour_of_day with the hour component --

UPDATE tripdata_2022
SET hour_of_day = DATEPART(HOUR, started_at);


-- Count the number of membertype --

CREATE VIEW member_type_count
AS
SELECT
    COUNT(CASE WHEN member_casual = 'casual' THEN 1 END) AS casual_count,
    COUNT(CASE WHEN member_casual = 'member' THEN 1 END) AS member_count
FROM 
    tripdata_2022;


-- Count the type of preferred bike per member type --

CREATE VIEW member_rideable_type_count
AS
SELECT 
    member_casual, 
    rideable_type,
    COUNT(*) AS rideable_type_count
FROM 
    tripdata_2022
GROUP BY 
    member_casual, 
	rideable_type;




-- Count of rides for each member type --
CREATE VIEW member_ride_count
AS
SELECT 
    member_casual,
    COUNT(*) AS ride_count
FROM 
    tripdata_2022
GROUP BY 
    member_casual;


-- Count of monthly rides for each member type --
CREATE VIEW member_month_ride_count
AS
SELECT
    member_casual,
    month_name,
    count(*) AS ride_count
FROM 
    tripdata_2022
GROUP BY
    member_casual, 
	month_name;

-- Count of weekday rides for each member type --

CREATE VIEW member_weekday_ride_count 
AS
SELECT
    member_casual,
    weekday_name,
    count(*) AS ride_count
FROM 
    tripdata_2022
GROUP BY
    member_casual, weekday_name;


-- Count of hour of day rides for each member type --

CREATE VIEW member_hour_ride_count
AS
SELECT
   member_casual,
   hour_of_day,
   count(*) AS ride_count
FROM 
    tripdata_2022
GROUP BY
    member_casual, 
	hour_of_day;




-- Average ride duration for each member type --

CREATE VIEW member_avg_ride_duration
AS
SELECT 
    member_casual, 
    AVG(ride_duration_minutes) AS avg_ride_duration
FROM 
    tripdata_2022
GROUP BY 
    member_casual;



-- Average ride duration for each member per month --
CREATE VIEW member_avg_ride_duration_per_month
AS
SELECT 
    member_casual, 
    AVG(ride_duration_minutes) AS avg_ride_duration,
    month_name
FROM 
    tripdata_2022
GROUP BY 
    member_casual, 
	month_name;



-- Average ride duration for each member per weekday --
CREATE VIEW member_avg_ride_duration_per_weekday
AS
SELECT 
    member_casual, 
    AVG(ride_duration_minutes) AS avg_ride_duration,
    weekday_name
FROM 
    tripdata_2022
GROUP BY 
    member_casual, 
	weekday_name;




 -- Top 10 start stations for casual members --


CREATE VIEW  casual_start_stations_top10 
AS
SELECT
    'Casual' AS membership_type,
    start_station_name,
    COUNT(*) AS ride_count,
    AVG(start_lat) AS avg_latitude,
    AVG(start_lng) AS avg_longitude
FROM
    tripdata_2022
WHERE
    member_casual = 'casual'
GROUP BY
    start_station_name
ORDER BY
    COUNT(*) DESC
OFFSET 0 ROWS
FETCH NEXT 10 ROWS ONLY;
select * from casual_start_stations_top10 


 -- Top 10 end stations for casual members --


CREATE VIEW  casual_end_stations_top10 
AS
SELECT
    'Casual' AS membership_type,
    end_station_name,
    COUNT(*) AS ride_count,
    AVG(end_lat) AS avg_latitude,
    AVG(end_lng) AS avg_longitude
FROM
    tripdata_2022
WHERE
    member_casual = 'casual'
GROUP BY
    end_station_name
ORDER BY
    COUNT(*) DESC
OFFSET 0 ROWS
FETCH NEXT 10 ROWS ONLY;



-- Top 10 start stations for annual members --


CREATE VIEW  annual_start_stations_top10 
AS
SELECT
    'member' AS membership_type,
    start_station_name,
    COUNT(*) AS ride_count,
    AVG(start_lat) AS avg_latitude,
    AVG(start_lng) AS avg_longitude
FROM
    tripdata_2022
WHERE
    member_casual = 'member'
GROUP BY
    start_station_name
ORDER BY
    COUNT(*) DESC
OFFSET 0 ROWS
FETCH NEXT 10 ROWS ONLY;



 -- Top 10 end stations for annual members --


CREATE VIEW  annual_end_stations_top10 
AS
SELECT
    'member' AS membership_type,
    end_station_name,
    COUNT(*) AS ride_count,
    AVG(end_lat) AS avg_latitude,
    AVG(end_lng) AS avg_longitude
FROM
    tripdata_2022
WHERE
    member_casual = 'member'
GROUP BY
    end_station_name
ORDER BY
    COUNT(*) DESC
OFFSET 0 ROWS
FETCH NEXT 10 ROWS ONLY;






-- The percentage of e-bike or classic bike usage by casual users, categorized by month--

CREATE VIEW casual_ebike_percentage 
AS
SELECT
    month_name AS month,
    COUNT(*) AS total_rides,
    (COUNT(CASE WHEN rideable_type = 'electric_bike' THEN 1 END) * 100.0 / COUNT(*)) AS percentage_ebike_usage
FROM
    tripdata_2022
WHERE
    member_casual = 'casual'
GROUP BY
    month_name;
select * from casual_ebike_percentage



  
CREATE VIEW overall_ebike_percentage 
AS
SELECT
    month_name AS month,
    COUNT(*) AS allride_count,
    (COUNT(*) * 100.0 / SUM(COUNT(*)) OVER ()) AS percentage_ebike_usage
FROM
    tripdata_2022
WHERE
    rideable_type = 'electric_bike'
GROUP BY
    month_name;

	select * from overall_ebike_percentage

