# Disk Monitoring Script
# Author: Balaji Reddy Lachhannagri
# Date: 2025-30-05
# Version: 1.0
# Description: This script checks disk usage on the system and alerts if any filesystem exceeds a specified threshold.
# Copyright: © 2025 Rushi Technologies. All rights reserved.


#!/bin/bash

# Threshold for alert (e.g., 80%)
threshold=80

# Log file (optional)
log_file="/var/log/disk_monitor.log"

# Timestamp
timestamp=$(date '+%Y-%m-%d %H:%M:%S')
echo "[$timestamp] Starting disk usage check..."

# Get disk usage (excluding tmpfs and devtmpfs)
df -h --output=source,pcent,target -x tmpfs -x devtmpfs | tail -n +2 | while read line; do
    filesystem=$(echo $line | awk '{print $1}')
    usage_percent=$(echo $line | awk '{print $2}' | tr -d '%')
    mount_point=$(echo $line | awk '{print $3}')

    echo "Filesystem: $filesystem | Usage: $usage_percent% | Mount: $mount_point"

    if [ "$usage_percent" -ge "$threshold" ]; then
        alert_msg="⚠️ ALERT: Disk usage on $mount_point is ${usage_percent}% (threshold: ${threshold}%)"
        echo "$alert_msg"
        echo "[$timestamp] $alert_msg" >> "$log_file"

        # Optional: Email notification (uncomment after configuring mail)
        # echo "$alert_msg" | mail -s "Disk Space Alert on $mount_point" you@example.com
    fi
done

echo "Disk check completed."