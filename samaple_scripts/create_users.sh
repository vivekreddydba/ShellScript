# Author: Balaji Reddy Lachhannagri
# Date: 2025-30-05
# Version: 1.0
# Description: This script creates users from a CSV file containing username, password, and group.
# Script: create_users_from_csv.sh
# Copyright: © 2025 Rushi Technologies. All rights reserved.
# Usage: Run this script as root. Ensure the CSV file is in the same directory or specify the path.

#!/bin/bash
CSV_FILE="users.csv"
LOG_FILE="/var/log/user_creation_from_csv.log"

# ===== Function Definitions =====

create_group_if_not_exists() {
    if ! getent group "$1" > /dev/null; then
        echo "Creating group: $1"
        groupadd "$1"
        echo "Group '$1' created." >> "$LOG_FILE"
    fi
}

create_user() {
    local username=$1
    local password=$2
    local groupname=$3

    if id "$username" &>/dev/null; then
        echo "User '$username' already exists."
        echo "[$(date)] WARN: User '$username' already exists." >> "$LOG_FILE"
    else
        echo "Creating user: $username"

        create_group_if_not_exists "$groupname"

        useradd -m -g "$groupname" "$username"

        echo "$username:$password" | chpasswd

        echo "✅ User '$username' created and added to group '$groupname'."
        echo "[$(date)] INFO: User '$username' created with group '$groupname'." >> "$LOG_FILE"
    fi
}

# ===== Main Script Execution =====

if [ "$EUID" -ne 0 ]; then
    echo "❌ Please run this script as root."
    exit 1
fi

if [ ! -f "$CSV_FILE" ]; then
    echo "❌ CSV file '$CSV_FILE' not found."
    exit 1
fi

# tail -n +2 "$CSV_FILE" 
# Skip header, read each row
# while IFS=',' read -r username password group; do 
# Reads each line of the CSV and splits it into variables username, password, and group based on the delimiter comma (,) using the IFS (Internal Field Separator) setting.
tail -n +2 "$CSV_FILE" | while IFS=',' read -r username password group; do
    if [[ -n "$username" && -n "$password" && -n "$group" ]]; then
        create_user "$username" "$password" "$group"
    else
        echo "Skipping invalid row: $username, $password, $group"
    fi
done

echo "All users processed from CSV. See $LOG_FILE for details."
