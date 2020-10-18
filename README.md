# Final Project

### Description of Communication Protocols:

#### Slack
- Project team members will use an open platform for communication using a unique Slack direct messaging group.

#### Pull Requests in GitHub
- Pull requests initiate discussion about team member commits.  Pull requests help start a code review and conversation about proposed changes before they're merged into the master branch.

# Database
The database for this project is built in PostgreSQL using pgAdmin4

## Structure
The database was designed using the QuickDBD tool.  The ERD is shown below in Fig.1.  <br>
Due to the manner in which the data is provided in the various csv files, composite primary keys must be used in order to ensure unique row identifiers.  

**Fig.1:**
![Fig.1](ERD.png)

## Challenges
As it currently stands, there are several issues with the structure of the database that will need to be addressed as we move through the project.  Most notably, we need to get the data in the tables to a state where they can be joined easily and correctly. Much of this can likely be pre-processed by reading the csv's into pandas df's and returning a clean csv, which can be then loaded into the postgreSQL database.  

* How to join Hall of Fame table with statistics tables since each have rows with multiple years and potentially several entries per year for each playerID?  Will the yearID in the Hall of Fame table really be necessary as we will be attempting to tie the stats to past years to a players induction? 
* How to combine rows for players that are traded during the season (i.e. multiple rows with the same playerID and yearID)?
* Should the stats be computed as an average per year for each player rather than looking at each year individually since the players are not up for Hall of Fame votes in the same year as they played?  
