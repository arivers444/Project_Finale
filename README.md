# Project_Finale

## Baseball Hall of Fame Inductees
Established in 1936, the Baseball Hall of Fame (HOF) recognizes the best baseball players in the game. Inductees are selected each year, and join a Hall of Fame Class. The players selected join a caste of the best players and most noted names in the game and include more than 300 players.

## Overview
The goal is to develop a model that is capabable of selecting the probable elected players based on player performance and awards. 

Each player that is selected for a HOF class is elected by commitee. Any candidate that meets the threshold of 75% of the comitee vote will be considered elected to the HOF. Using Logistic regresion, the aim is to be able to predict future players based on past class electees perofmance.


## Data
Data for this project was attained from seanlahman.com

The data is contained in a number of .csv file all of which are available fro the source website.

the specific .csv files used are:
1) HallofFDame.csv
2) Batting.csv
3) Pitching.csv
4) Fielding.csv
5) Awards.csv

## Expected outcomes
Machine learning model that predicts HOF players based on performance in batting, fielding pitching and awards.

## Questions to answer

1) Can the model select the appropriate HOF canditate.
2) Accuracy of the model overall
3) Does previous awards help identify players that may be inducted
4) Does player popularity effect the election results.
5) Does statistical performance predict candidates

## Data exploration

In order to run the machine learning model, each file had to be cleaned and prepared to create the database.

### Issues 
There were numerous issues encountered during this phase. 
- Nominations may cover multiple years, and the end result was not always an induction. To rectify this, we selected the last year each player was nominated as it would result in the selection or non selection of each player.
- 

