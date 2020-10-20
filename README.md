# Project_Finale

# Team Roles
Nick worked on the Database section this week (as the Cirlce Role).
Dane worked on the Machine Learning Model and provided the [provisional code](logistic_regression_MLmodel.txt) that connects to this provisional database.

# Database
The database for this project is built in PostgreSQL using pgAdmin4.

## Raw Data
Raw data was obtained in the form of several CSV files from [Lahman's Baseball Database](http://www.seanlahman.com/baseball-archive/statistics/).  Attempts to load this data as it was downloaded presented some unique problems that will need to be addressed as we move forward in the project.  

## Structure
The database was designed using the QuickDBD tool.  The ERD is shown below in Fig.1.  <br>
Due to the manner in which the data is provided in the various csv files, composite primary keys must be used in order to ensure unique row identifiers.  As we move through the project and determine how we need the data to look, this ERD will be updated.

**Fig.1:**
![Fig.1](ERD.png)

## Challenges
As it currently stands, there are several issues with the structure of the database that will need to be addressed to move forward with the project.  Most notably, we need to get the data in the tables to a state where they can be joined easily and correctly for the machine learning model. Much of this can likely be pre-processed by reading the csv's into pandas df's and returning a clean csv, which can be then loaded into the postgreSQL database.  This should be the main focus for the Circle Role in week 2.  

* How to join Hall of Fame table with statistics tables since each have rows with multiple years and potentially several entries per year for each playerID?  Will the yearID in the Hall of Fame table really be necessary as we will be attempting to tie the stats to past years to a players induction? 
* How to combine rows for players that are traded during the season (i.e. multiple rows with the same playerID and yearID)?
* Should the stats be computed as an average per year for each player rather than looking at each year individually since the players are not up for Hall of Fame votes in the same year as they played?