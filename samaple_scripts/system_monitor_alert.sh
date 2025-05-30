# Author: Balaji Reddy Lachhannagri
# Date: 2025-30-05
# Script: system_monitor_alert.sh
# Version: 1.0
# Description: This script monitors CPU and memory usage, alerts if thresholds are exceeded, and logs the events.
# Usage: Run this script with appropriate permissions to access system metrics.
# Copyright: © 2025 Rushi Technologies. All rights reserved.


#!/bin/bash

# Thresholds
cpu_threshold=75   # in percent
memory_threshold=80   # in percent

# Log file (optional)
LOG_FILE="/var/log/system_monitor_alerts.log"

# Timestamp
timestamp=$(date '+%Y-%m-%d %H:%M:%S')
echo "[$timestamp] Running system monitor..."


### CPU USAGE ###
cpu_idle=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}' | cut -d'.' -f1)
cpu_usage=$((100 - cpu_idle))
echo "CPU Usage: ${cpu_usage}%"

if [ "$cpu_usage" -ge "$cpu_threshold" ]; then
  echo "ALERT: CPU usage is above ${cpu_threshold}% (Current: ${cpu_usage}%)"
  echo "[$timestamp] ALERT: CPU usage is ${cpu_usage}%" >> "$LOG_FILE"
  # Optional: Send alert (email)
  # echo "CPU usage high: ${cpu_usage}%" | mail -s "CPU Alert" your_email@example.com

fi


### MEMORY USAGE ###
mem_info=$(free -m)
total_mem=$(echo "$mem_info" | awk '/Mem:/ {print $2}')
used_mem=$(echo "$mem_info" | awk '/Mem:/ {print $3}')
mem_percent=$((used_mem * 100 / total_mem))
echo "Memory Usage: ${mem_percent}%"

if [ "$mem_percent" -ge "$memory_threshold" ]; then
  echo "ALERT: Memory usage is above ${memory_threshold}% (Current: ${mem_percent}%)"
  echo "[$timestamp] ALERT: Memory usage is ${mem_percent}%" >> "$LOG_FILE"
  # Optional: Send alert (email etc.)
  # echo "Memory usage high: ${mem_percent}%" | mail -s "Memory Alert" your_email@example.com
fi

echo "Done."
