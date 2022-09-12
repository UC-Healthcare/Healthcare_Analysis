# Healthcare_Analysis

## Project Overview
- Selected topic:
  - Healthcare: Correlation between physical and mental health. 
- Presentation (Google Slides)
  - https://docs.google.com/presentation/d/1VOKThQU5-b4-bnefdcjQFqS2OTrTk7YJTZ_tH2pm3Ic/edit?usp=sharing
- Reason why we selected our topic
  - We are interested in exploring if there is a correlation between physical health indicators and mental health outcomes for patients.
  - We are all interested in or have backgrounds in the health industry.
- Description of our source of data
  - Kaggle dataset: https://www.kaggle.com/datasets/cdc/behavioral-risk-factor-surveillance-system
  - Our dataset consists of health survey data from 400,000 people from the years 2011-2015.
  - There are 330 total columns, but a small percentage of columns are mostly empty.
- Questions we hope to answer with the data
  - Which health choices are most correlated with mental health?
  - Which common diseases are most correlated with impact mental health?
  - Can we predict mental health outcomes from physical health backgrounds?

## Data Exploration
- We used data from the 2015 CDC Health Care Survey which is the principal source of information on the health of the civilian non-institutionalized population of the United States and is one of the major data collection programs of the National Center for Health Statistics.
- We researched the codebook to understand column meanings, answer codes, and to manually select a subset of columns for our analysis.
- We loaded the data in an S3 bucket and imported it using pyspark.
- Transformed the data using pyspark. Selected relevant columns, removed NA values, replaced values, and updated column names. Created one table for ML and another one for dashboard purposes, with differences between the two to account for the different use cases.
- Loaded data into Postgres, performed a join with the state table and then connected the Database to perform ML and create the Dashboard.
![image](https://user-images.githubusercontent.com/102445183/189580523-8b88d930-e244-4941-b548-054bbaac7ada.png)

## Analysis
- Analysis was performed using Seaborn to create detailed and informative graphics using cleaned data from AWS RDS connection using Psycopg2 dependency.
- Cleaned out certain values indicating no response to questions that were skewing data points.
- Performed visual analysis comparing certain datapoints to others to determine relationships.
![image](https://user-images.githubusercontent.com/102445183/189580384-c6488861-1077-4457-9e22-bed8ccc1d13d.png)

## Machine Learning
- Preliminary data preprocessing: The data was first preprocessed in SQL, where unnecessary features were manually removed (focusing on redundant  features), null values were removed, and the columns were renamed for clarity. Then once the data was loaded into a pandas dataframe, the shape, data types, and null value count was double checked before feature engineering.
- Preliminary feature engineering: Some features used a code 88 for “none”, which was changed to 0. The code 99, “did not respond” was changed to the median of the column. Outliers were also removed by changing them to the median value. The target was binned into two bins for binary classification. In the Pycaret setup, the data was normalized, transformed into an approximately normal distribution, and continuous numerical features were binned.
- Preliminary feature selection: A random forest classifier was fit on the data with all features, and a feature importance plot was used to rank features by importance. I chose a cutoff of 0.015 variable importance because there was a jump down in values after that point. The result was 27 features kept for modeling (out of 41 originally).
- How data was split into training and testing sets: The data was split into training and testing sets using PyCaret’s “.sample()” function, with 5% or 11,108 rows being kept aside for testing.
- Explanation of model choice, including limitations and benefits: To choose the optimal model, I utilized an open-source machine learning library called “PyCaret”. PyCaret includes a function called compare_models() which runs 12 different binary classification models on the data and outputs a table with the accuracy, recall, precision, and more for each model. Based on the results of the analysis, I chose the gradient boosting classifier model because it is an option that is highly accurate yet still interpretable. Additionally, I know that gradient boosted models use ensemble learning to combine weak learners into a more powerful model. However, some limitations of gradient boosting classifiers are that they have potential for overfitting and take a long time to run.
![image](https://user-images.githubusercontent.com/102445183/189580442-083ab209-1b7e-4559-89ef-c6c0f54f5b26.png)

## Future Analysis Recommendations
- Additional datasets
  - Our data was limited to 2015. For future analysis loading additional years could provide more insights.
- More feature cleaning before machine learning
  - Machine learning was performed on 42 columns. Some codes for features included a very small percentage of the responses. The accuracy of the model may be improved if we devoted time to manually go through all 42 columns, removing or recategorizing these very small response categories (such as “refused to answer” or “didn’t know”)

## Technologies
- Amazon S3
- PostgreSQL
- PySpark
- Jupyter Notebook
- Pandas
- PyCaret
