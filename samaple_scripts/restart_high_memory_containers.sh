#!/bin/bash

# Script: restart_high_memory_containers.sh
# Description: Restart Docker containers using more memory than the threshold

# Memory usage threshold in MiB (e.g., 500 MiB)
threshold_mb=500

echo "Checking running Docker containers for memory usage..."

# Get container IDs
containers=$(docker ps -q)

for container in $containers; do
  # Get container name
  name=$(docker inspect --format='{{.Name}}' "$container" | sed 's|/||')

  # Get memory usage in MiB (works with Docker stats)
  mem_usage=$(docker stats "$container" --no-stream --format "{{.MemUsage}}" | awk '{print $1}' | sed 's/[^0-9.]//g')

  # Get memory unit (MiB/GiB)
  unit=$(docker stats "$container" --no-stream --format "{{.MemUsage}}" | awk '{print $2}')

  # Convert GiB to MiB if needed
  if [[ "$unit" == *GiB ]]; then
    mem_usage=$(awk "BEGIN {print $mem_usage * 1024}")
  fi

  mem_int=${mem_usage%.*}

  echo "$name is using $mem_int MiB"

  # Check if memory exceeds threshold
  if [ "$mem_int" -ge "$threshold_mb" ]; then
    echo "$name is using high memory ($mem_int MiB) — restarting..."
    docker restart "$container"
    echo "$name restarted."
  fi

  echo "------------------------------"
done

echo " Memory check and restart operation completed."
