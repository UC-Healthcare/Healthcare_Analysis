# Healthcare_Analysis

 Aaron

## Segment 1
 main
- Week 1 roles:
  - Square (GitHub): Aaron
  - Triangle (ML Model): Kylie
  - Circle (Database): Adriana
  - X (Technologies): Lukas
- Selected topic
 Aaron
  - Healthcare: impact of health choices and/or diseases on mental health. 
- Presentation (Google Slides)
  - https://docs.google.com/presentation/d/1VOKThQU5-b4-bnefdcjQFqS2OTrTk7YJTZ_tH2pm3Ic/edit?usp=sharing
- Reason why we selected our topic
  - Interested in seeing if there is a correlation between health choices and mental health outcome for patients.
- Description of their source of data
  - Kaggle dataset: https://www.kaggle.com/datasets/cdc/behavioral-risk-factor-surveillance-system
- Questions they hope to answer with the data?
  - What health choices impact mental health?
  - What diseases impact mental health?
- Description of the communication protocols
  - Messaging: Slack group
  - Video conferencing: Zoom

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
- Description of the communication protocols
  - We use a slack group chat to collaborate on our project goals, creating threads under messages with suggestions, questions, next steps, etc.
  - We use Zoom video conferencing to discuss impediments to our project progress and reach solutions as a team.

## Segment 2
- Week 2 roles:
  - Square (ML Model): Kylie
  - Triangle (Database): Adriana
  - Circle (Analysis): Aaron
  - X (Dashboard): Lukas
- Description of the data exploration phase of the project:
- Description of the analysis phase of the project:
  - Analysis was performed using Seaborn to create detailed and informative graphics using cleaned data from AWS RDS connection using Psycopg2 dependency.
  - Cleaned out certain values indicating no response to questions that were skewing data points.
  - Performed visual analysis comparing certain datapoints to others to determine relationships.
- Outline of the project (this may include images, but should be easy to follow and digest):
- Machine Learning Model
  - Preliminary data preprocessing: The data was first preprocessed in SQL, where unnecessary features were manually removed (focusing on redundant  features), null values were removed, and the columns were renamed for clarity. Then once the data was loaded into a pandas dataframe, the shape, data types, and null value count was double checked before feature engineering.
  - Preliminary feature engineering: Some features used a code 88 for “none”, which was changed to 0. The code 99, “did not respond” was changed to the median of the column. Outliers were also removed by changing them to the median value. The target was binned into two bins for binary classification. In the Pycaret setup, the data was normalized, transformed into an approximately normal distribution, and continuous numerical features were binned.
  - Preliminary feature selection: A random forest classifier was fit on the data with all features, and a feature importance plot was used to rank features by importance. I chose a cutoff of 0.015 variable importance because there was a jump down in values after that point. The result was 27 features kept for modeling (out of 41 originally).
  - How data was split into training and testing sets: The data was split into training and testing sets using PyCaret’s “.sample()” function, with 5% or 11,108 rows being kept aside for testing.
  - Explanation of model choice, including limitations and benefits: To choose the optimal model, I utilized an open-source machine learning library called “PyCaret”. PyCaret includes a function called compare_models() which runs 12 different binary classification models on the data and outputs a table with the accuracy, recall, precision, and more for each model. Based on the results of the analysis, I chose the gradient boosting classifier model because it is an option that is highly accurate yet still interpretable. Additionally, I know that gradient boosted models use ensemble learning to combine weak learners into a more powerful model. However, some limitations of gradient boosting classifiers are that they have potential for overfitting and take a long time to run.
 main
