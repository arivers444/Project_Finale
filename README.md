# Final Project - Baseball Hall Of Fame

# Team Roles
For Segment #4 Nick worked essentially as the square role:
* finalized README.md for the main branch
* hosted/led meetings
* finalized code by cleaning up and being sure it was appropriately commented
* helped build and organize the final presentation

## Background

### Goal
The goal of this project is to create a Machine Learning model that will accurately predict the likelihood of a player being inducted into the Baseball Hall of Fame (HOF) based on their playing statistics over the course of their Major League Baseball career.


### Expected outcomes
Machine learning model that predicts HOF players based on performance in batting, fielding, pitching, and awards.
Questions to answer:

1. Can the model select the appropriate HOF candidate?
2. Accuracy of the model overall?
3. Do previous awards help identify players that may be inducted?
4. Does player popularity effect the election results?
5. Does statistical performance predict candidates?

## Resources
* Python 3.7
* Jupyter Notebook / Google Colab
* PostgreSQL 11 / pgAdmin4
* Libraries:  pandas, scikit-learn, seaborn, matplotlib, psycopg2, tkinter

### Raw Data
Raw data was obtained in the form of several CSV files from [Lahman's Baseball Database](http://www.seanlahman.com/baseball-archive/statistics/).  Attempts to load this data as it was downloaded presented some unique problems that are described in the next section. 

### Pre-Processing Raw Data
Once a preliminary database was created, it was necessary to address several problems that were encountered.  The foremost issue being that the database tables did not have a true primary key.  That is, there was no unique identifier for each row of data.  Despite attempts to employ a composite primary key, the raw csv files could not be used in their current form.  Data was provided with rows for each player in every year since 1871 to 2019.  Following group discussion, it was decided that the batting, fielding, and pitching statistics would be aggregated to produce career statistics.  This was accomplished by using the Pandas groupby method, and provided a single row of data unique to each playerID.  To get this same result for the Hall of Fame table, we needed to drop duplicates and keep the last row (this would keep a yes if the player was inducted and keep a no if they were not).  Finally, the group decided to use a total count of awards from the awards csv data.  Additionally, the raw csv files had a lot of noise variables that the group decided to leave out of the database (e.g. number of games played).  Once these changes were made, the Pandas dataframes were exported to csv files so they could be imported into the PostgreSQL database.<br>
<br>
The code to accomplish these tasks can be found in the Juptyer Notebook:  [preprocessing_data.ipynb](preprocessing_data.ipynb).<br>

## Database
The database for this project is built in PostgreSQL using pgAdmin4.

### Structure
The database was designed using the QuickDBD tool.  [QuickDataBaseDiagrams.com](http://www.quickdatabasediagrams.com) <br>
The final ERD is shown below in Fig.1.  <br>

**Fig.1:**
![Fig.1](ERD_Rev2.png)
<br>

### Accessing the Database
Since our PostgreSQL database is hosted locally, it was necessary for each team member to create a database on their machine.  The following are steps to do so:

1. Git Pull the pre-processed csv from the [data directory](/data)
    * HOF.csv
    * Batting_cleaned.csv
    * Fielding_cleaned.csv
    * Pitching_cleaned.csv
    * award_count.csv
    * People_cleaned.csv
2. Create a database instance in pgAdmin4
3. Use the queries in the file [schema_Rev2.sql](schema_Rev2.sql) to create the necessary tables
4. Manually import the csv's above into the database tables
5. Run the queries in the file [queries.sql](queries.sql) to join the tables
6. Manually export these new tables to csv's if desired
<br>
Note:  We tested our machine learning model by exporting and pulling in these csv's to our Python code prior to the final production ready code that pulled directly from the PostgreSQL database. <br>

### Connection to Machine Learning Algorithm

#### Interim Step
As a first step, and in order to test the machine learning algorithm, we first query the database in pgAdmin4 to create new tables which could then be exported as csv files.  These csv files could then be easily loaded to Pandas dataframes.  This also allowed team members to work through the machine learning code without having to set up the database on their local machines (since our PostgreSQL database is hosted locally).<br>
The queries made in pgAdmin4 can be found in the file:  [queries.sql](queries.sql)<br>
Additionally, the csv's exported out of the database for testing the ML code can be found in the [data directory](/data):  
* ml_table.csv (all data combined)
* ml_pitching.csv
* ml_BattingFielding.csv

#### Final Connection
Finally, the code was developed to directly connect the PostgreSQL database to the machine learning code.   The same SQL queries as the interim step are built into the Python code.  The advantage of this method is that the JOINS are executed and the output goes directly into a Pandas dataframe (df).  One dataframe was created for batters/fielders and one for pitchers. This split was performed in an effort to minimize discrepancies in available player statistics between those players that play in the field and bat each inning versus pitchers that do not have the same available fielding and batting data.  These df's can be pre-processed as necessary to make it ready for the machine learning (ML) algorithm.  In this case, it was necessary to remove NaN's as the ML code did not like empty values in the dataframe it was being fed.  Also, the inducted column needed to be encoded from text to numeric datatype.  <br>
This code can be found in the Jupyter Notebook:  [HOF_randomF.ipynb](HOF_randomF.ipynb)
<br>

## Machine Learning

### Overview 
Due to the fact that we are looking at a binary problem (inducted to HOF? yes/no), we decided to begin our analysis with a simple supervised logistic regression model.  This returned about 76% accuracy with about 90% recall for those not inducted and about 50% recall on those that were inducted (using the batting/fielding df).  The group then decided to try to improve the recall on the inducted group and chose to run the Random Forest Classifier was used to predict the likelihood of future Hall of Famers.  This produced much better recall.  Additional advantages of Random Forest are that the results are much easier to interpret than logistic regression, and the feature importances are easy to obtain.  The output lists the Confusion Matrix, Accuracy Score, and Classification Report for each Dataframe. Currently, the model is running at about 87% accuracy for the batters/fielders with about 91% recall for those not inducted and 73% recall for those that were inducted.

### Description of code
After the pre-processing as described in the section above was completed, we choose which df to run (pitching or batting/fielding).  We have included some conditional if statements to define input (X) variables based on which dataset is run.  The batting/fielding dataset (~750 rows) is almost 3 times larger than the pitching dataset (~270 rows).  For this reason, we decided to keep all of the features for the pitching model and drop the features that contribute less than 3% importance.  The output (y) variable is always whether or not the player was inducted.  <br>
<br>
The data was split into testing and training sets using sklearn.model_selection train_test_split.  The default 75% train to 25% test was utilized.  We created a StandardScaler instance and scaled the data to equalize the range of data for each feature (e.g. Hits vs. Batting Average or Wins vs. ERA).  When creating the random forest classifier we decided to start with high number of forests (128). This did not cause any issues. <br>
<br>
The next step was to investigate feature importance.  We pull out the features and sort them in descending order.  This information is also visualized with a bar chart.  

### Results 
The Batting/Fielding dataset produced an accuracy score of 86.6%.  The recall was 91% for those not inducted and 73% for those inducted.  <br>
The Pitching dataset was much smaller and produced an accuracy score of 85.1%.  The recall was 96% for those not inducted and only 53% for those inducted.  <br> 
Further details can be found in the Appendix of the Google Slides Presentation (linked below).

### Statistical Investigation
In order to address the question of human bias in the selection process (i.e. popularity versus statistical merit), the group decided to investigate the statistics in the instances where the model correctly predicted the outcome versus incorrect predictions.  That is, how much difference are there in the mean values in some of the key features?  The various boxplots can be found in the [analysis folder](/analysis)

## Presentation / Dashboard
[Google Slides](https://docs.google.com/presentation/d/17Ze4TTQrjxyFDvFswRykFGpzRVK7VgnTofYM1js-FEg/edit?ts=5fa32ae8#slide=id.p)

## Challenges
Building the database took several iterations.  The primary and foreign keys needed to be tweaked in order to import the csv data into the PostgreSQL database.  The initial assumption was that we could load the csv's as we downloaded them and pull the data out with SQL queries as needed (i.e. using SELECT, JOINS, GROUPBY, et. al.).  However, we learned that the database has to be designed specifically to allow the primary and foreign keys to do their job as unique identifiers.  After digging into the data and revisiting the questions we were trying to answer, we were able to write Python code to clean the csv's and get the data in an appropriate format.  Even after grouping the data by playerID, when trying to load the cleaned csv's into the database we found that our foreign key assignments were not allowing us to load in the data.  This was due to the fact that not all of the same playerID's were in each csv.  To overcome this, we pulled the csv with a master list of players and tied all of the other tables to this one with foreign keys.  

## Recommendations for Future Analysis
* Tune the parameters of the ML model to optimize the accuracy (being careful not to overfit)
  * Resource:  [towards data science post](https://towardsdatascience.com/hyperparameter-tuning-the-random-forest-in-python-using-scikit-learn-28d2aa77dd74)
* Consider other methods to analyze Awards data.  
  1. Remove altogether since award count holds such a strong importance when running the batting/fielding data
  2. Break out important awards like MVP, Gold Gloves, Cy Young, etc. and remove journalism awards
* Build an improved dashboard with html & interactive javascript
  1. Dynamic content that allows users to choose pitching or batting fielding changing the page based on the selection
  2. Input area to predict Hall of Fame induction based on stats the user would enter
  3. Connect PostgreSQL database to Amazon AWS
* Consider building a Deep Learning model
