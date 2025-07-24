#! /usr/bin/bash

is_valid_phone_number() {
    local phone_number="$1"
    if [[ "$phone_number" =~ ^[0-9]{10}$ ]]; then
        return 0
    else
        return 1
    fi
}
is_valid_pin_number() {
    local pin_number="$1"
    if [[ "$pin" =~ ^[0-9]{4}$ ]]; then
        return 0
    else
        return 1
    fi
}

# Prompt user for registration details
read -p "Enter your name: " name
read -p "Enter your phone number: " phone_number
read -p "Enter initial balance: " balance
# In register.sh (after user registration):
read -sp "Enter  your 4-digit PIN: " pin
# Check if the phone number already exists

if grep -q "$phone_number" users.txt; then
    echo "User with phone number $phone_number is already registered."
else
    if ! is_valid_phone_number "$phone_number"; then
      echo "The phone number must be a 10-digit number."
    else
        if ! is_valid_pin_number "$pin"; then
          echo "The pin must be a 4-digit number."
        else
          echo "$name|$phone_number|$balance|$pin" >> users.txt
          echo "Registration successful!"
          echo "$(date '+%Y-%m-%d %H:%M:%S') | $name registered" >> transactions.txt
        fi
    fi
fi



    
