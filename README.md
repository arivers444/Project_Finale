### I am responsible for the GitHub portion of this week's deliverables.

## Description of Communication Protocols:

### Slack Direct Messaging
- Project team members will use an open platform for communication using a unique Slack direct messaging group.

### Pull Requests
- Pull requests will initiate discussion about team member commits. Pull requests help start a code review and conversation about proposed changes before they're merged into the master branch.

# Baseball Hall of Fame Inductees 

## Project Overview

The goal of this project is to create a Machine Learning model that will accurately predict the likelihood of a player being inducted into the Baseball Hall of Fame based on their playing statistics over the course of their Major League Baseball career.

The analysis begins by taking in data from several CSV files found on [SeanLahman.com](http://www.seanlahman.com/baseball-archive/statistics/). A database was then created using PostgreSQL and pgAdmin4. New dataframes were created and data was cleaned using Jupyter Notebook. 

Two dataframes were created, one for batters/fielders and one for pitchers. This split was performed in an effort to minimize discrepancies in available player statistics between those players that play in the field and bat each inning versus pitchers that do not have the same available fielding and batting data. 

These dataframes were then appended to include whether or not a player has been inducted into the Baseball Hall of Fame. Data was then split into training and testing datasets for our model. Data was also scaled to equalize the range of data for each feature.

Next, Random Forest Classifier was used to predict the likelihood of future Hall of Famers. The output lists the Confusion Matrix, Accuracy Score, and Classification Report for each Dataframe. Currently, the model is running at about 87% accuracy for the batters/fielders with about 91% recall for those not inducted and 73% recall for those that were inducted.