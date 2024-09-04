-- Creating a new database
create database cycling_accidents;

--  To use the followwing database
use cycling_accidents;

-- Creating a new table with the same columns as of the CSV file
create table if not exists accident_data (
    Ind int,
    Accident_Index VARCHAR(50),
    Number_of_Vehicles INT,
    Number_of_Casualties INT,
    Date DATE,
    Time time,
    Speed_limit INT,
    Road_conditions VARCHAR(100),
    Weather_conditions VARCHAR(100),
    Day VARCHAR(50),
    Road_type VARCHAR(100),
    Light_conditions VARCHAR(100)
); 

--  Loading the CSV file into the table
load data infile 'accidents.csv' into table accident_data
fields terminated by ','
ignore 1 lines;

-- Inspecting the data

select * from accident_data 
Limit 10;

select count(*) from accident; -- There are '827861' records.

-- Using the following query to learn about columns
describe accident_data;

-- Creating new table, from raw table so we don't lose our original table data
create table accident
like accident_data;

-- Now we will insert the data from the original table into accident table to have backup
insert accident
select * 
from accident_data;

-- Deleting records before 2000 to analyse more recent data and simplyfying the process

delete  
from accident_data
where date < '2000-01-01';

select count(*) from accident_data; -- Now there are '314883' records.

-- Checking for any duplicates Using Ind (Index)

select Ind ,count(*) as Count
from accident_data 
group by 1
having COUNT(*) > 1;  -- No duplicates found

-- checking for null values
select * from accident_data
where
    Ind IS NULL OR
    Accident_Index IS NULL OR
    Number_of_Vehicles IS NULL OR
    Number_of_Casualties IS NULL OR
    Date IS NULL OR
    Time IS NULL OR
    Speed_limit IS NULL OR
    Road_conditions IS NULL OR
    Weather_conditions IS NULL OR
    Day IS NULL OR
    Road_type IS NULL OR
    Light_conditions IS NULL;  /* No null value found */

-- Now we will perform EDA analysis to answer the following questions

-- How has the number of accidents changed over the years?
-- Count of accidents by year 
select year(Date) as Year, count(*) as Total_Accidents
from accident_data
group by Year
order by Year;

-- On which days of the week do accidents most frequently occur?
-- Count of accidents by days of the week ; weekdays have higher accident count than weekends
select Day, count(*) as Total_Accidents
from accident_data
group by Day
order by Total_Accidents desc ;

-- What is the relationship between the number of vehicles involved in an accident and the average number of casualties?
-- It demonstrates a clear positive correlation 
select Number_of_Vehicles , avg(Number_of_Casualties) as Avg_Casualties
from accident_data
group by Number_of_Vehicles
order by Avg_Casualties ;

-- How do light conditions affect the average number of casualties in accidents? 	
select Light_conditions, avg(Number_of_Casualties) AS Avg_Casualties, count(*) AS Total_Accidents
from accident_data
group by Light_conditions
order by Avg_Casualties desc;

-- Which weather conditions are most commonly associated with accidents?	
select Weather_conditions, count(*) as Total_Accidents
from accident_data
group by Weather_conditions
order by Total_Accidents desc;

-- Adding avg_casualties column to determine the severity of weather conditions
select Weather_conditions, count(*) as Total_Accidents, AVG(Number_of_Casualties) as Avg_Casualties
from accident_data
group by Weather_conditions
order by Avg_Casualties desc; 		

