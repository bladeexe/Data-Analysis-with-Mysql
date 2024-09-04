# Cycling Accident Data Analysis
## Overview

This MySQL project focuses on analysing data related to cycling accidents. As someone who recently took up cycling, I wanted to delve into this dataset to uncover insights that could help identify risky conditions and times for cyclists. I will be publishing an article soon on medium so that I can provide the analysis in detail.

The is a real world dataset of Bicycle accidents in Great Britain from 1979 to 2018. 
Source : https://www.kaggle.com/datasets/johnharshith/bicycle-accidents-in-great-britain-1979-to-2018/data

The dataset includes various details about each accident, such as the number of vehicles involved, the number of casualties, the date and time of the accident, speed limits, road and weather conditions, and the type of road.

## Primary objective
The primary objective is to identify risky conditions for cycling by analysing accident frequency, severity, and contributing factors. To do so, we need to answer the following questions:

**1. How have accident numbers changed over the years?
2. Which days of the week see the most accidents?
3. What is the relationship between the number of vehicles involved and the severity of accidents?
4. How do light conditions affect the severity of accidents?
5. Which weather conditions are most commonly associated with accidents?**

After importing the CSV file, I prepared the dataset for analysis by performing the following data cleaning steps

1. **Duplicate Records:** I insured that no duplicate records existed in the dataset based on the Ind index.
2. **Null Values:** After that I also verified that there were no null values across all columns.
3. **Date Range:** I only focused on data from the year 2000 onwards to ensure the analysis was based on recent trends.
 
