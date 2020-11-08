# Baseball Hall of Fame Inductees 

## Project Outline

### Goal
- The goal of this project is to create a Machine Learning model that will accurately predict the likelihood of a player being inducted into the Baseball Hall of Fame based on their playing statistics over the course of their Major League Baseball career.

### Database & Preprocessing
- The analysis takes in data from several CSV files found on [SeanLahman.com](http://www.seanlahman.com/baseball-archive/statistics/). An ERD was created using [QuickDataBaseDiagrams.com](http://www.quickdatabasediagrams.com). A database was then created using PostgreSQL and pgAdmin4. 

- Two new dataframes were created and data was cleaned using both Jupyter Notebook and Google Colab. One dataframe was created for batters/fielders and one for pitchers. This split was performed in an effort to minimize discrepancies in available player statistics between those players that play in the field and bat each inning versus pitchers that do not have the same available fielding and batting data. 

- These dataframes were then appended to include whether or not a player has been inducted into the Baseball Hall of Fame. Data was then split into training and testing datasets for our model. Data was also scaled to equalize the range of data for each feature.

### Machine Learning
- Next, Logistic Regression was used as the initial model in analyzing the data. This returned about 76% accuracy with about 90% recall for those not inducted and about 50% recall on those that were inducted.

- Second, Random Forest Classifier was used to predict the likelihood of future Hall of Famers with much better recall. The output lists the Confusion Matrix, Accuracy Score, and Classification Report for each Dataframe. Currently, the model is running at about 87% accuracy for the batters/fielders with about 91% recall for those not inducted and 73% recall for those that were inducted.