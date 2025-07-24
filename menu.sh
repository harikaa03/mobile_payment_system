#! /usr/bin/bash
# Initialize ncurses
clear
tput civis  # Hide cursor

echo "Mobile Payment System Menu"
echo "1. Register User "
echo "2. Check Balance"
echo "3. Make a Transfer"
echo "4. Delete a User "
echo "5. Exit"

while :; do
    echo -n "Enter your choice [1-5]: "
    read option

    case $option in
        1)
            # Execute registration logic (in register.sh)
            ./register.sh  # Replace with the actual path to your register.sh script
            ;;
        2)
            # Execute balance checking logic (in balance.sh)
            ./balance.sh  # Replace with the actual path to your balance.sh script
            ;;
        3)
            # Execute transfer logic (in transfer.sh)
            ./transfer.sh  # Replace with the actual path to your transfer.sh script
            ;;
        4)
            # Execute delete logic (in delete_user.sh)
            ./delete_user.sh  # Replace with the actual path to your transfer.sh script
            ;;
        5)
            echo "Exiting..."
            exit
            ;;
        *)
            echo "Invalid choice. Please select 1, 2, 3, 4 or 5."
            ;;
    esac
done
# Clean up ncurses
tput cnorm  # Restore cursor
