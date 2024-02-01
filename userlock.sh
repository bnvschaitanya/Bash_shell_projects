#!/bin/bash

# Generate timestamp
ts=$(date +%F)

# Infinite loop for user interaction
while true; do
    read -p "Enter the username to lock and backup: " user

    # Check if the username is provided
    if [ -z "$user" ]; then
        echo "Username not provided."
    else
        # Check if the user exists
        if id "$user" &> /dev/null; then
            # Lock the user account
            passwd -l "$user"

            # Retrieve user's home directory
            homeDir=$(grep "^${user}:" /etc/passwd | cut -f 6 -d ":")
            echo "User's home directory: $homeDir"

            # Check if the home directory exists
            if [ -d "$homeDir" ]; then 
                echo "Home directory exists."

                # Create a tar archive of the home directory
                tar -cf "${user}-${ts}.tar" "$homeDir"
                echo "Backup completed."
            fi

            exit 0
        else
            echo "User $user does not exist."
        fi
    fi
done
