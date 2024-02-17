#!/bin/bash

#VARIABLES
TEXT_SERVICES="1) cut\n2) color\n3) perm\n4) style\n5) trim"
PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"

#FUNCTIONS

askUser() 
{
read SERVICE_ID_SELECTED

case $SERVICE_ID_SELECTED in
	1|2|3|4|5)
		echo $SERVICE_ID_SELECTED
    ;;
	*)
    echo -e "\nI could not find that service. What would you like today?" 
    echo -e $TEXT_SERVICES
		askUser
    ;;
esac
}

#PROGRAM

#DISPLAY LIST OF SERVICES

echo "~~~~~ MY SALON ~~~~~"
echo -e "\nWelcome to My Salon, how can I help you?"
echo -e "\n"$TEXT_SERVICES

#ASK USER TO PICK A SERVICE

askUser

#GET NAME OF SERVICE
SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")

#ASK USER FOR PHONE NUMBER

echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE

#CHECK FOR CUSTOMER
CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

  #CUSTOMER DOESN'T EXIST
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME

    #ASK FOR TIME
    echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME"
    read SERVICE_TIME

    #INSERT VALUES TO DB <CUSTOMERS>
    INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(name,phone) VALUES ('$CUSTOMER_NAME','$CUSTOMER_PHONE')")

  else
    #ASK FOR TIME
    echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME"
    read SERVICE_TIME
 
  fi

    #INSERT VALUES TO DB <APPOINTMENTS>
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED,'$SERVICE_TIME')")

    #CONFIRM APPOINTMENT
    echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."