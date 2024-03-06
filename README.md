# Capstone Project Cyclistic Case Study 

## PHASE 1: Ask 

### Introduction
I am a junior data analyst working on the marketing analyst team at Cyclistic, a bike-share company in Chicago which features more than 5800 bicycles and 600 docking stations. Cyclistic sets itself apart by also offering reclining bikes, hand tricycles, and cargo bikes, making bike-share more accessible to people with disabilities and riders who can’t use a standard two-wheeled bike. 

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

I uploaded 12 csv files as tables in the dataset `cyclistic`, another table named “trip_data_2022” was created, containing  all rows of data for the entire year which comprises over 5 million rows.

### Data Cleaning

1. Identify and remove null values.
2. Identify and remove duplicate values.
3. Identify and remove spaces before and after values.
4. Identify and remove rows where the start time is later than the end time.
5. Identify and remove trip times that are over 1 day.
6. Identify and remove trip times that are less than 1 minute.


## PHASE 4: Analyze and Share

### Analyze
1. Create a column for calculating ride duration in minutes.  
2. Create a column for weekdays.  
3. Create a column for months.  
4. Add an "hour_of_day" column.  
5. Populate the "hour_of_day" column with the hour component.  
6. Count the number of member types.  
7. Count the types of preferred bikes per member type.  
8. Count the total rides for each member type.  
9. Count the monthly rides for each member type.  
10. Count the weekday rides for each member type.  
11. Count the hour of day rides for each member type.  
12. Calculate the average ride duration for each member type.  
13. Calculate the average ride duration for each member per month.  
14. Calculate the average ride duration for each member per weekday.  
15. Identify the top 10 start stations for casual members.  
16. Identify the top 10 end stations for casual members.  
   

### Visualisation

In order to answer the business task, I prepared a few charts.

### 1. Overall Ride Share
Insights:
Annual members accounted for 59.7% of the total rides (4.32 million), while our target group, casual riders, took 40.3% of the total rides.

### 2. Distribution of Rideable Types
Of our annual members, 65.6% choose classic bikes to ride, while 50.6% of casual users opt for classic bikes as well. It seems that classic bikes are more popular than electric bikes for both types of users.

### 3. Comparison of Average Durations
Annual members have an average ride duration of 12 minutes. In contrast, casual users ride for an average of 23 minutes, which is almost twice as long.

### 4. Monthly Comparison of Average Durations
The average ride duration for annual members barely changes across different months. However, for casual users, we observe a rising trend from the winter season to the summer season and a declining trend from the summer season to the winter season.

### 5. Weekday Comparison of Average Durations

Once again, the average ride duration for annual members remains relatively consistent across different weekdays. However, for casual users, the duration increases to 26 or 27 minutes on Saturdays and Sundays compared to an average time of 21 or 22 minutes on workdays.

### 6.  Comparison of Monthly Ride Counts
In this graphic, we observe a rising trend from February to August and a declining trend from September to December for both memberships. We can observe a significant impact of the winter season on the usage of Cyclistic bikes.

### 7. Comparison of Weekday Ride Counts
For our membership users, we observe a drop in bike usage on weekends. However, for casual users, there is a rising trend in bike usage during the weekends.
### 8.  Comparison of Ride Counts by Hour of the Day
As seen in the diagram, there is an extremely pronounced rising trend between 6 and 8 o'clock, as well as between 15 and 17 o'clock for our membership users. Additionally, a gradual rising trend can be observed between 6 and 17 o'clock for casual users. This indicates that annual members primarily use bikes for commuting, while casual riders use bike rentals for leisure puroses. It's an inference drawn from the trends observed.
### 9. Top Ten Stations Preferred by Casual Users
After searching the station names on Google Maps, I found that all these stations are near various attractions.This strengthens my viewpoint that casual riders use bike rentals for leisure purposes.

## PHASE 5: Action

### Conclusion
The differences and similarities between annual members and casual users are as follows:
### 1. Seasonal Trends
Seasons have a significant impact on overall ride frequency. During temperature drops, fewer riders are observed, and vice versa.
### 2. Weekday and Weekend Trends
Members are more active on weekdays (Monday to Friday) and less active on weekends, while casual riders show increased activity on weekends.
### 3. Usage Patterns
The primary usage purpose of annual members is most likely for commuting, while casual riders use bike rentals for leisure purposes.



### Recommendations
### 1. Attraction-Specific Bike Allocation
Allocate a portion of bikes specifically for stations near attractions. This can help maintain a steady supply of bikes where demand is higher due to the proximity to popular tourist destinations.
### 2. Weekend-Specific Promotions
Since casual users are more active on weekends, design targeted promotional offers that encourage them to sign up for annual memberships during weekends. This could include discounted rates or special benefits for weekend sign-ups.
### 3. Flexible Weekend Plans
Create flexible membership plans that cater to weekend usage patterns. For example, offer reduced rates or extended ride durations specifically for weekends as part of the annual membership package.
### 4. Attraction-Based Partnerships
Given that the top ten stations for casual users are near various attractions, establish partnerships with these attractions to offer joint promotions. For example, provide discounts for annual memberships with the purchase of attraction tickets.

