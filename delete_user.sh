#! /usr/bin/bash

# Read the phone number from user input
read -p "Enter the phone number to delete: " phone_number

# Check if the user exists in the users.txt file
if grep -q "$phone_number" users.txt; then
    # Remove the user entry from users.txt
    sed -i "/$phone_number/d" users.txt
    echo "User with phone number $phone_number has been deleted."
else
    echo "User with phone number $phone_number does not exist."
fi
