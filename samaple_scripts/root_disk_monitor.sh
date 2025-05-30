#!/bin/bash

# Script: root_storage_check.sh
# Description: This script checks the root filesystem's disk usage and alerts if it exceeds a specified threshold.
# Author: Balaji Reddy Lachhannagri
# Date: 2025-30-05
# Version: 1.0
# Copyright: © 2025 Rushi Technologies. All rights reserved.
# Threshold for alert (e.g., 80%)

# Example of using if-elif-else to check disk space and take action

threshold_critical=85
threshold_warning=80

# Get current disk usage percentage for the root filesystem
current_usage=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')

echo "Current disk usage: $current_usage%"

if [ $current_usage -ge $threshold_critical ]  # >=
then
    echo "Disk usage is critical ($current_usage%). Taking immediate action!"
    # Add commands to free up disk space or notify administrators
    # For example, you could delete old logs or temporary files
    # Send an alert email or message
    echo "Consider cleaning up old files or expanding disk space."
elif [ $current_usage -ge $threshold_warning ]
then
    echo "Disk usage is high ($current_usage%). Consider freeing up space."
    # Add commands to optimize disk usage
    # For example, you could notify administrators or suggest cleanup actions
    echo "You may want to check for large files or directories."
else
    echo "Disk usage is normal ($current_usage%)."
    # No action needed
    echo "System is operating within normal parameters."
fi