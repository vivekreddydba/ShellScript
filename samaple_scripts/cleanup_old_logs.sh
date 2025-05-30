#!/bin/bash

# Script: cleanup_ci_logs_xargs.sh
# Description: Delete *.log files older than 14 days using xargs


# Define the directories to check for log files
log_dirs=("/var/log/jenkins" "/var/log/gitlab" "/opt/devops/logs" "/var/log/ci")
# Define the number of days after which logs should be deleted
days=14

echo "🧹 Starting log cleanup (files older than $days days)..."
echo "Timestamp: $(date)"

for dir in "${log_dirs[@]}"; do
  if [ -d "$dir" ]; then
    echo "Checking: $dir"
    
    deleted_count=$(find "$dir" -type f -name "*.log" -mtime +$days -print0 2>/dev/null \
      | tee >(tr '\0' '\n' | wc -l) \
      | xargs -0 rm -v 2>/dev/null | wc -l)

    if [ "$deleted_count" -gt 0 ]; then
      echo "$deleted_count log files deleted from $dir"
    else
      echo "No old log files to delete in $dir"
    fi
  else
    echo "Directory not found: $dir"
  fi
  echo "---------------------------"
done

echo "Log cleanup complete."
