
# Project_Finale

Submitting ML Model
Here is the current Logistical Regression ML Model using Google Colab. We chose this model do to the binary answer we want. Was this player inducted into the Hall of Fame, yes or no? A Logistical Regression Model can analyzie statistics from the players career and give us the answer. The features we chose were batting, fielding, pitching and awards. The model runs at 80% accuracy at the moment. Which raises the question whether or not the machine is wrong or were the humans inconsistantly choosing merits on which the players were inducted into the Hall Of Fame. We will investigate the data from the machine learning model to find the answer.

The preprocessing of the data consisted of first cleaning the csv files. We were able to find datasets on batting, fielding and pitching and awards starting in the late 1800's. We then decided to filter the data to only include data from batting fielding and pitching starting in 1937 as this the earliest data we could find on awards given. Some of the files had imperfections like empty cells, which we had to correct before running the model.

Using sklearn.preprocessing LabelEncoder we transformerd the string data in the 'inducted', and 'playerID' columns into integers. 

Wether or not they were inducted wasthe independent variable 'y'. Sixteen features in the batting/ fielding data set were set as 'x'. After calculating the importances of all the feature we decided to drop the lowest five features from the dataset ('SF', 'GIDP', 'IBB', 'CS', 'SB') as the had little to no effect the accuracy score of the machine learning model. 

Although we thought 80% accuracy was quite good, we decided to try a Random Forest Machine Learning Model. The result produced an 88% accuracy score, so we are currently staying with this model. 

The data was split into testing and training sets using sklearn.model_selection train_test_split. We created a StandardScaler instance and scaled the data. When creating the random forest classifier we decided to start with high number of forests (128). This did not cause any issues. 



ML Model Update. Added user interface and a bar chart. 11/1/2020 6:54pm
https://colab.research.google.com/drive/15FxKPFIvdBB1D6gBEd9JUsD_yQekn_XN?usp=sharing

11/1/2020 5:35pm
https://colab.research.google.com/drive/15FxKPFIvdBB1D6gBEd9JUsD_yQekn_XN?usp=sharing

Older verson:
https://colab.research.google.com/drive/1cXjdHwemP3AJ_f5Jfpr0uwXNQXcpY9wb?usp=sharing



=======
# Final Project

## Description of Communication Protocols:

### Slack Direct Messaging
- Project team members will use an open platform for communication using a unique Slack direct messaging group.

### Pull Requests
- Pull requests will initiate discussion about team member commits. Pull requests help start a code review and conversation about proposed changes before they're merged into the master branch.

# Baseball Hall of Fame Inductees 

## Project Outline

### Goal
- The goal of this project is to create a Machine Learning model that will accurately predict the likelihood of a player being inducted into the Baseball Hall of Fame based on their playing statistics over the course of their Major League Baseball career.

### Database & Preprocessing
- The analysis takes in data from several CSV files found on [SeanLahman.com](http://www.seanlahman.com/baseball-archive/statistics/). An ERD was created using [QuickDataBaseDiagrams.com](http://www.quickdatabasediagrams.com). A database was then created using PostgreSQL and pgAdmin4. 

**Fig.1:**
![Fig.1](ERD_Rev2.png)

- Two new dataframes were created and data was cleaned using both Jupyter Notebook and Google Colab. One dataframe was created for batters/fielders and one for pitchers. This split was performed in an effort to minimize discrepancies in available player statistics between those players that play in the field and bat each inning versus pitchers that do not have the same available fielding and batting data. 

- These dataframes were then appended to include whether or not a player has been inducted into the Baseball Hall of Fame. Data was then split into training and testing datasets for our model. Data was also scaled to equalize the range of data for each feature.

### Machine Learning
- Next, Logistic Regression was used as the initial model in analyzing the data. This returned about 76% accuracy with about 90% recall for those not inducted and about 50% recall on those that were inducted.

- Second, Random Forest Classifier was used to predict the likelihood of future Hall of Famers with much better recall. The output lists the Confusion Matrix, Accuracy Score, and Classification Report for each Dataframe. Currently, the model is running at about 87% accuracy for the batters/fielders with about 91% recall for those not inducted and 73% recall for those that were inducted.

## Expected outcomes
Machine learning model that predicts HOF players based on performance in batting, fielding, pitching, and awards.
Questions to answer:

    1) Can the model select the appropriate HOF candidate?
    2) Accuracy of the model overall?
    3) Do previous awards help identify players that may be inducted?
    4) Does player popularity effect the election results?
    5) Does statistical performance predict candidates?
