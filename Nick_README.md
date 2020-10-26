# Project_Finale

# Team Roles
For Segment 2, Nick worked on the Database section again this week.  Dane worked on the Machine Learning Model and provided the [provisional code](logistic_regression_MLmodel.txt) that connects to this provisional database.

# Database
The database for this project is built in PostgreSQL using pgAdmin4.

## Data

### Raw Data
Raw data was obtained in the form of several CSV files from [Lahman's Baseball Database](http://www.seanlahman.com/baseball-archive/statistics/).  Attempts to load this data as it was downloaded presented some unique problems that will need to be addressed as we move forward in the project.

### Pre-Processing
As noted above, the raw data was not in a format that could be loaded into our database and needed to be pre-processed in order to be useful for the machine learning model.  Each csv file needed to have a column with unique rows to use for a primary key.  We chose the playerID as this unique identifier.  To achieve this, the Hall of Fame file was modified by dropping all of the duplicate entries of playerID and only keeping the last entry since this would tell us if the player was inducted or not.  The Batting, Fielding, and Pitching statistics were grouped by playerID and aggregated to provide career statistics for each player.  Finally, the Awards data was simply grouped by playerID to obtain a count of awards that each player received over their career.  Each csv is read in, cleaned, and then exported to provide the format that can be loaded into our PostgreSQL database.  The code to perform this pre-processing is found in the file:  [preprocessing_data.ipynb](preprocessing_data.ipynb).

## Structure
The database was designed using the QuickDBD tool.  The revised ERD is shown below in Fig.1.  <br>
Now that the data has been cleaned the primary keys are much simplier than our first attempt.  When trying to load the cleaned csv's into the database we found that our foreign key assignments were not allowing us to load in the data.  This was due to the fact that not all of the same playerID's were in each csv.  To overcome this, we pulled the csv with a master list of players and tied all of the other tables to this one with foreign keys.  

**Fig.1:**
![Fig.1](ERD_Rev2.png)

### Accessing the Database
Since our PostgreSQL database is hosted locally, it will be necessary for each team member to create a database on their machine.  The following are steps to do so:

1. Pull the cleaned csv from the [data directory](/data)
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

Note:  We can test our machine learning model by pulling in these csv's prior to the final production ready code that will pull directly from the database.  
