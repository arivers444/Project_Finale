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



