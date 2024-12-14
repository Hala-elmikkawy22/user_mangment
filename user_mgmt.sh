#!/bin/bash

# Define functions for each action
add_user() {
    read -p "Enter username to add: " username
    if id "$username" &>/dev/null; then
        echo "User '$username' already exists."
    else
        sudo useradd "$username"
        echo "User '$username' added successfully."
    fi
}

delete_user() {
    read -p "Enter username to delete: " username
    if id "$username" &>/dev/null; then
        sudo userdel "$username"
        echo "User '$username' deleted successfully."
    else
        echo "User '$username' does not exist."
    fi
}

list_users() {
    echo "Listing all users:"
    cut -d: -f1 /etc/passwd
}

# Display menu
while true; do
    echo -e "\nUser Account Management"
    echo "1. Add User"
    echo "2. Delete User"
    echo "3. List Users"
    echo "4. Exit"
    read -p "Enter your choice [1-4]: " choice

    case $choice in
        1) add_user ;;
        2) delete_user ;;
        3) list_users ;;
        4) echo "Exiting script. Goodbye!"; break ;;
        *) echo "Invalid choice. Please try again." ;;
    esac
done

