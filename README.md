# Healthcare_Analysis

## Project Overview
- Selected topic:
  - Healthcare: Correlation between lifestyle and mental health. 
- Presentation (Google Slides)
  - https://docs.google.com/presentation/d/1VOKThQU5-b4-bnefdcjQFqS2OTrTk7YJTZ_tH2pm3Ic/edit?usp=sharing
- Reasons why we selected our topic
  - We are interested in exploring if there is a correlation between lifestyle indicators and mental health outcomes for patients.
  - Our group had a shared interest in and/or background in the health industry.
- Description of our source of data
  - Kaggle dataset: https://www.kaggle.com/datasets/cdc/behavioral-risk-factor-surveillance-system
  - Our dataset consists of CDC health survey data from over 400,000 telephone interviews with people living in the US in 2015.
  - There are 330 total columns, but a small percentage of columns are mostly empty.
- Questions we hope to answer with the data
  - Which health choices & common diseases are most correlated with mental health?
  - Could you predict mental health outcomes using physical health indicators?
  - Do other indicators have an impact on mental health?

## Data Exploration
- Data source: Our data is from the 2015 CDC Health Care Survey which is the principal source of information on the health of the civilian non-institutionalized population of the United States and is one of the major data collection programs of the National Center for Health Statistics.
- Understanding the data: Researched the codebook to understand column meanings, answer codes, and to manually select a subset of columns for our analysis.
- Data storage: Loaded the data in an Amazon S3 bucket and imported it using PySpark.
- Preparing the data for analysis: Transformed the data using PySpark which consisted of selecting relevant columns, removing NA values, replacing values, and updating column names. Created one table for machine learning and another one for dashboard purposes, with differences between the two to account for the different use cases.
- Database management: Loaded data into Postgres, performed a join with the separate state table and then connected the Database to Jupyter notebook code to perform machine learning and create the analysis dashboard.
![image](https://user-images.githubusercontent.com/102445183/189580523-8b88d930-e244-4941-b548-054bbaac7ada.png)

## Analysis
- Dashboard: https://drive.google.com/file/d/1b1Ht-8DS1jnd9z44IwShEgx3ozyJlPp2/view?resourcekey
- Tools: Analysis was performed using Seaborn to create detailed and informative graphics using cleaned data from AWS RDS connection using Psycopg2 dependency.
- Data cleaning: Cleaned out certain code values indicating no response to questions; these no response answers were affecting the distribution of the data.
- Visualizations: Performed visual analysis comparing certain features to others to determine relationships.
![image](https://user-images.githubusercontent.com/102445183/189580384-c6488861-1077-4457-9e22-bed8ccc1d13d.png)

## Machine Learning
- Preliminary data preprocessing: The data was first preprocessed in SQL, where unnecessary features were manually removed (focusing on redundant features), null values were removed, and the columns were renamed for clarity. Then once the data was loaded into a pandas dataframe, the shape, data types, and null value count was double checked before feature engineering.
- Preliminary feature engineering: Some features used a code 88 for “none”, which was changed to 0. The codes 7, 9 and 99 for "don't know" and “did not respond” were changed to the rounded median of the column. Codes were changed to be binary or ordinal. Outliers were removed. The target was binned into 0 and 1 for binary classification. In the Pycaret setup, the data was normalized, and features with more than 12 unique values were binned.
- Preliminary feature selection: A random forest classifier was fit on the data with all features, and a feature importance plot was used to rank features by importance. I chose a cutoff of 0.02 variable importance because there was a jump down in values after that point. The result was 23 features kept for modeling (out of 41 originally).
- How data was split into training and testing sets: The data was split into training and testing sets using PyCaret’s “.sample()” function, with 10% or 24,315 rows being kept aside for testing.
- Explanation of model choice, including limitations and benefits: To choose the optimal model, I utilized an open-source machine learning library called “PyCaret”. PyCaret includes a function called compare_models() which runs 12 different binary classification models on the data and outputs a table with the accuracy, recall, precision, and more for each model. Based on the results of the analysis, I chose the gradient boosting classifier model because it is an option that is highly accurate yet still interpretable. Gradient boosted models use ensemble learning to learn from weak learners and combine the results into a more powerful model. Some limitations of gradient boosting classifiers are that they have potential for overfitting and are computationally expensive.
- So far, the model has been trained on a training set of the cleaned data, and incremental changes have been made to improve the model. From the intial model, the non-answer codes for the target variable were changed from the median to the rounded median to preserve integer data types. Features with over 12 unique values were binned and I added the use of SMOTE oversampling to account for the uneven target variable (0 was at 70% while 1 was at only 30%)
- The confusion matrix shows a high rate of true negatives (correctly predicted as having no bad mental health days in the past month), moderate false negatives and true positives (falsely predicted good mental health and correctly predicted bad mental health respectively), and very few false positives (falsely predicted good mental health). Since we are dealing with health data, ideally the recall, or correctly predicted bad mental health of all those that actually have bad mental health, would be higher. This is a goal to focus on for future revisiting of the project.
- The current accuracy score is 75.57%, which has shown improvement throughout the weeks of the project. The first draft random forest model had an accuracy of 71.3% The previous draft of the gradient boosted classifier model had an accuracy of 75.28%, so the most recent model version is the most accurate. Additionally, the recall and F1 scores have both improved in this model version.
![image](https://user-images.githubusercontent.com/102445183/189580442-083ab209-1b7e-4559-89ef-c6c0f54f5b26.png)

## Future Analysis Recommendations
- Additional datasets
  - Our data was limited to 2015. For future analysis loading additional years would allow for more trend analysis and high relevant-low data columns to play a bigger role.
- Clear and Complete Data
  - Some fields that were deemed of higher importance had odd calculations leading to unclear results with visualization. Refusal to answer certain important questions caused problems in visualizations.

## Technologies
Database:
- Amazon S3
- PostgreSQL
- PySpark

Analysis and Machine Learning:
- Jupyter Notebook
- Excel
- Pandas
- NumPy
- PyCaret

Visualizations:
- Tableau
- Seaborn
