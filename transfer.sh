#! /usr/bin/bash

# Prompt user for sender and recipient phone numbers
read -p "Enter sender's phone number: " sender
read -p "Enter recipient's phone number: " recipient
read -p "Enter transfer amount: " amount
read -sp "Enter your PIN: " entered_pin
# Update balances in users.txt
sender_balance=$(grep "$sender|" users.txt | cut -d '|' -f 3)
recipient_balance=$(grep "$recipient|" users.txt | cut -d '|' -f 3)

if [ -z "$sender_balance" ] || [ -z "$recipient_balance" ]; then
    echo "Invalid sender or recipient. check the entered phone numbers."

else
    stored_pin=$(grep "$sender|" users.txt | cut -d '|' -f 4)
    if [ "$entered_pin" != "$stored_pin" ]; then
       echo "Incorrect PIN. Access denied."
    
    elif [ "$sender_balance" -lt "$amount" ]; then
       echo "Insufficient balance."
    else
       new_sender_balance=$((sender_balance - amount))
       new_recipient_balance=$((recipient_balance + amount))
       sed -i "s/$sender|$sender_balance/$sender|$new_sender_balance/" users.txt
       sed -i "s/$recipient|$recipient_balance/$recipient|$new_recipient_balance/" users.txt
       echo "Transfer successful!"
    
       echo "$(date '+%Y-%m-%d %H:%M:%S') | $sender transferred $amount to $recipient" >> transactions.txt

    fi
fi