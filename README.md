# Capstone project Cyclistic Case Study 

## PHASE 1: Ask 

### Introduction
I’m a junior data analyst working on the marketing analyst team at Cyclistic, a bike-share company in Chicago which features more than 5800 bicycles and 600 docking stations. Cyclistic sets itself apart by also offering reclining bikes, hand tricycles, and cargo bikes, making bike-share more inclusive to people with disabilities and riders who can’t use a standard two-wheeled bike. 

The majority of riders opt for traditional bikes; about 8% of riders use the assistive options. Cyclistic uses are more likely to ride for leisure, but about 30% use the bikes to commute to work each day. 

Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. The Director of marketing believes the company’s future success depends on maximizing the number of annual memberships. 

Therefore, our team wants to understand how casual riders and annual members use Cyclistic bikes differently and design marketing strategies aimed at converting casual riders into annual members.

### Business Task

How do annual members and casual riders use Cyclistic bikes differently?

How to convert casual riders into annual members?

### Stakeholders
Lily Moreno: The director of marketing and my manager.

Cyclistic executive team: A detail-oriented executive team who will decide whether to approve the recommended marketing program.

Cyclistic marketing analytics team: A team of data analysts responsible for collecting, analyzing, and reporting data that helps guide Cyclistic’s marketing strategy.

## PHASE 2: Prepare

### Data Sources
Public data from Motivate International Inc.(Divvy Bicycle Sharing Service from Chicago) under this [license](https://divvybikes.com/data-license-agreement).

[Cyclistic’s historical trip data](https://divvy-tripdata.s3.amazonaws.com/index.html) available in .csv format

### Data range
January 2022 to December 2022

### Data Organisation
There are 12 files with naming convention of YYYYMM-divvy-tripdata and each file includes information for one month, such as the ride id, bike type, start time, end time, start station, end station, start location, end location, and whether the rider is a member or not. 

## PHASE 3: Process

### Data Combination

I uploaded 12 csv files as tables in the dataset `cyclistic`, another table named “trip_data_2022” was created, containing  all rows of data for the entire year which are 5 millions rows.

### Data Cleaning

1. Identify and remove null values.
2. Identify and remove duplicate values.
3. Identify and remove spaces before and after values.
4. Identify and remove start time later than endtime.
5. Identify and remove trip times that are over 1 day.
6. Identify and remove trip times that are less than 1 minute.


## PHASE 4: Analyze and Share

### Analyze

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

### 1. Overall Ride Share
Insights:
Annual members accounted for 59.7% of the total rides (4.32 million), while our target group, casual riders, took 40.3% of the total rides.

### 2. Distribution of Rideable Types
Of our annual members, 65.6% choose classic bikes to ride, while 50.6% of casual users opt for classic bikes as well. It seems that classic bikes are more popular than electric bikes for both types of users.

### 3. Comparison of Average Durations
The average ride duration for annual members is 12 minutes, compared to casual users, which is 23 minutes, almost half the duration.

### 4. Monthly Comparison of Average Durations
The average ride duration for annual members barely changes across different months. However, for casual users, we observe a rising trend from the winter season to the summer season and a declining trend from the summer season to the winter season.

### 5. Weekday Comparison of Average Durations

Once again, the average ride duration for annual members remains relatively consistent across different weekdays. However, for casual users, the duration increases to 26 or 27 minutes on Saturdays and Sundays compared to an average time of 21 or 22 minutes on workdays.

### 6.  Comparison of Monthly Ride Counts
In this graphic, we observe a rising trend from February to August and a declining trend from September to December for both memberships. We can observe a significant impact of the winter season on the usage of Cyclistic bikes.

### 7. Comparison of Weekday Ride Counts
For our membership users, we observe a drop in bike usage on weekends. However, for casual users, there is a rising trend in bike usage during the weekends.
### 8.  Comparison of Ride Counts by Hour of the Day
As seen in the diagram, there is an extremely pronounced rising trend between 6 and 8 hours, as well as between 15 and 17 hours for our membership users. Additionally, a gradual rising trend can be observed between 6 and 17 hours for casual users. This indicates that annual members primarily use bikes for commuting, while casual riders use bike rentals for leisure puroses.
### 9. Top Ten Stations Preferred by Casual Users



## PHASE 5: Action

### Conclusion







