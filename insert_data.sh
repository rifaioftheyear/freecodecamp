#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE TABLE games, teams")
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS

do
  #Insert into teams table.
  TEAMS=$($PSQL "SELECT name FROM teams WHERE name='$WINNER'")
  if [[ $WINNER != "winner" ]]
  then
      if [[ -z $TEAMS ]]
      then
        INSERT_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
          if [[ $INSERT_TEAM == "INSERT 0 1" ]]
          then
            echo Inserted team: $WINNER
          fi
       
      fi
  fi



  TEAMS2=$($PSQL "SELECT name FROM teams WHERE name='$OPPONENT'")
  if [[ $OPPONENT != "opponent" ]]
  then
      if [[ -z $TEAMS2 ]]
      then
        INSERT_TEAM2=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
          if [[ $INSERT_TEAM2 == "INSERT 0 1" ]]
          then
            echo Inserted team: $OPPONENT
          fi


        
      fi
  fi

   #Insert into games table.

  #Get winner and opponent ids from the teams table.
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
  
  if [[ -n $WINNER_ID || -n $OPPONENT_ID ]]
  then
    INSERT_GAMES=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
  fi
  #INSERT_GAMES=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES(YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS)")

  

done  
