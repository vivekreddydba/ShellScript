#!/bin/bash

# Script: top_process_alerts.sh
# Description: Monitor top 5 CPU and memory consuming processes and alert if they exceed thresholds.
# Usage: Run this script with appropriate permissions to access process information.
# author: Balaji Reddy Lachannagri
# Date: 2025-30-05
# Version: 1.0
# Copyright: © 2025 Rushi Technologies. All rights reserved.

cpu_threshold=80
memory_threshold=80
log_file="/var/log/top_process.log"
timestamp=$(date '+%Y-%m-%d %H:%M:%S')

echo "==============================" | tee -a "$log_file"
echo " Process Monitor @ $timestamp" | tee -a "$log_file"
echo "==============================" | tee -a "$log_file"

# === Top 5 by CPU Usage ===
echo " Top 5 Processes by CPU Usage:" | tee -a "$log_file"
echo "PID   USER     CPU%   MEM%   COMMAND" | tee -a "$log_file"

ps -eo pid,user,%cpu,%mem,comm --sort=-%cpu | head -n 6 | tail -n 5 | while read pid user cpu mem cmd; do
    echo "$pid   $user   $cpu   $mem   $cmd" | tee -a "$log_file"

    # Remove decimal and check CPU threshold
    cpu_int=${cpu%.*}
    if [ "$cpu_int" -ge "$cpu_threshold" ]; then
        echo "ALERT: High CPU Usage - PID: $pid, USER: $user, CPU: $cpu%, CMD: $cmd" | tee -a "$log_file"
    fi
done

# Add a separator for clarity
echo "==============================" | tee -a "$log_file"

# === Top 5 by Memory Usage ===
echo "🔝 Top 5 Processes by Memory Usage:" | tee -a "$log_file"
echo "PID   USER     CPU%   MEM%   COMMAND" | tee -a "$log_file"

ps -eo pid,user,%cpu,%mem,comm --sort=-%mem | head -n 6 | tail -n 5 | while read pid user cpu mem cmd; do
    echo "$pid   $user   $cpu   $mem   $cmd" | tee -a "$log_file"

    # Remove decimal and check MEM threshold
    mem_int=${mem%.*}
    if [ "$mem_int" -ge "$memory_threshold" ]; then
        echo "ALERT: High Memory Usage - PID: $pid, USER: $user, MEM: $mem%, CMD: $cmd" | tee -a "$log_file"
    fi
done

echo " Monitoring complete." | tee -a "$log_file"
