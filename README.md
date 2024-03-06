# Capstone project Cyclistic Case Study 

## PHASE 1: Ask 

### Introduction
I’m a junior data analyst working on the marketing analyst team at Cyclistic, a bike-share company in Chicago which features more than 5800 bicycles and 600 docking stations. Cyclistic sets itself apart by also offering reclining bikes, hand tricycles, and cargo bikes, making bike-share more inclusive to people with disabilities and riders who can’t use a standard two-wheeled bike. 
The majority of riders opt for traditional bikes; about 8% of riders use the assistive options. Cyclistic uses are more likely to ride for leisure, but about 30% use the bikes to commute to work each day. 
Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. The Director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, our team wants to understand how casual riders and annual members use Cyclistic bikes differently and design marketing strategies aimed at converting casual riders into annual members.

### Business Task

How do annual members and casual riders use Cyclistic bikes differently?
How to convert casual riders into annual members?

### Stakeholders:
Lily Moreno: The director of marketing and my manager.
Cyclistic executive team: A detail-oriented executive team who will decide whether to approve the recommended marketing program.
Cyclistic marketing analytics team: A team of data analysts responsible for collecting, analyzing, and reporting data that helps guide Cyclistic’s marketing strategy.

## PHASE 2: Prepare

### Data Sources:
Public data from Motivate International Inc.(Divvy Bicycle Sharing Service from Chicago) under this license.
Cyclistic’s historical trip data available in .csv format

### Data range: 
January 2023 to December 2023

### Data Organisation:
There are 12 files with naming convention of YYYYMM-divvy-tripdata and each file includes information for one month, such as the ride id, bike type, start time, end time, start station, end station, start location, end location, and whether the rider is a member or not. The corresponding column names are ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng and member_casual.

## PHASE 3: Process

### Data Combination:

I uploaded 12 csv files as tables in the dataset `cyclistic`, another table named “trip_data_2022” was created, containing  all rows of data for the entire year which is
5 millions rows.

### Data Cleaning:

1. Identify and Remove null values.
2. Identify and remove duplicate values.
3. Identify and remove spaces before and after values.
4. Identify and remove start time later than endtime.
5. Identify and remove trip times that are over 1 day.
6. Identify and remove trip times that are less than 1 minute.


## PHASE 4: Analyze and Share

### Analyze:

1. Create a column with the calculated ride duration in minutes.
2. Create a column with the weekdays.
3. Create a column with the months.
4. Add hour_of_day column.
5. Populate hour_of_day with the hour component.
6. Count the number of membertype.
7. Count the type of preferred bike per member type.
8. Count of rides for each member type.
9. Count of monthly rides for each member type.
10. Count of weekday rides for each member type.
11. Count of hour of day rides for each member type.
12. Average ride duration for each member type.
13. Average ride duration for each member per month.
14. Average ride duration for each member per weekday.
15. Top 10 start stations for casual members.
16. Top 10 end stations for casual members.

### Visualisation

In order to answer the business task, I prepared a few charts.

1. Total ride share
Insights:




## Summary


PHASE 5: Action

Conclusion and Recommendations:





