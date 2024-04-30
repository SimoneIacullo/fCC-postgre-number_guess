#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

RAND=$(( $RANDOM % 1000 + 1 ))
echo "Enter your username:"
read USERNAME
CHECK_USER=$($PSQL "SELECT username FROM users WHERE username='$USERNAME'")

if [[ -z $CHECK_USER ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  ADD_USERNAME=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  ADD_USER_ID=$($PSQL "INSERT INTO games(user_id) VALUES($USER_ID)")
else
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  GAME=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id=$USER_ID")
  BEST=$($PSQL "SELECT MIN(best_game) FROM games WHERE user_id=$USER_ID")
  echo "Welcome back, $USERNAME! You have played $GAME games, and your best game took $BEST guesses."
  ADD_USER_ID=$($PSQL "INSERT INTO games(user_id) VALUES($USER_ID)")
fi


COUNTER=1
echo "Guess the secret number between 1 and 1000:"
read GUESS
while [ $GUESS != $RAND ]
do
  if ! [[ $GUESS =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    read GUESS
  else
    ((COUNTER++))
    if [[ $GUESS -gt $RAND ]]
    then
      echo "It's lower than that, guess again:"
    elif [[ $GUESS -lt $RAND ]]
    then
      echo "It's higher than that, guess again:"
    fi
    read GUESS
  fi
done

NUMBER_OF_GUESSES=$($PSQL "SELECT MAX(games_played) FROM games WHERE user_id=$USER_ID")
ADD_COUNTER=$($PSQL "UPDATE games SET best_game=$COUNTER WHERE games_played=$NUMBER_OF_GUESSES")
echo "You guessed it in $COUNTER tries. The secret number was $RAND. Nice job!"
