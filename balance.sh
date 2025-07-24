#! /usr/bin/bash

# Prompt user for phone number
read -p "Enter your phone number: " phone
read -sp "Enter your PIN: " entered_pin
#Search for user in users.txt
balance=$(grep "$phone|" users.txt | cut -d '|' -f 3)
if [ -z "$balance" ]; then
    echo "User not found. check the entered phone number"

else
    stored_pin=$(grep "$phone|" users.txt | cut -d '|' -f 4)
    if [ "$entered_pin" != "$stored_pin" ]; then
        echo "Incorrect PIN. Access denied."
    else
        echo "Your balance: $balance"
    fi
fi