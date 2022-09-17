# Healthcare_Analysis
## Deliverable 1 
###On Branch 

Mockup folder contains sample dataset , which has been uploaded to PgAdmin and linked to ML model 

DB_Healthcare contains work for real data set, will be retrieving data from S3, Using Pyspark to transfer and  load it to table on RDS instance in PGAdmin. Then planning to create some joins and additional tables for vizualization/dashboard and link database to machine learning model 


## Deliverable 2
###On Branch 
Data Exploration: 

-Data we used was Health Care Survey for 2015 from CDC which is the principal source of information on the health of the civilian noninstitutionalized population of the United States and is one of the major data collection programs of the National Center for Health Statistics

- We researched the codebook to understand columns and make the selection.
- We loaded the data in S3 bucket and import it using pyspark 
- Transformed data using pyspark. Selected relevant columns, removing NA, replacing values and updating column names and replacing values where needed.   Created a  table for ML and another one  for dashboard purposes
- Loaded data to Postgres , performed joint with state table and then connected Database  to perform ML and Dashboard. 


Updated ERD
3 tables :
-ML Data
-Dashboard Data
-States

Database is connected to pandas. 



## Deliverable 3
###On Branch 

Updated requirement Texts 
Added Git ignore, organized repo

## Deliverable 4 

Checked work against rubric 
Updated Slides 



### Topic

Health Behavioral Risk 

## Reason

Common Interest and good dataset 

## Question to Answer 

- Trends on Population at Risk 
- Predicting Mental Health Risk by Lifestyle


## About DataSet
State-specific data on preventive health practices and risk
behaviors that are linked to chronic diseases, injuries, and preventable infectious diseases in the adult population.
Factors assessed by the BRFSS include tobacco use, health care coverage, HIV/AIDS knowledge or prevention, physical activity, and fruit and vegetable consumption. Data are collected from a random sample of adults (one perhousehold) through a telephone survey.

