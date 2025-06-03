# This script demonstrates how to store command-line arguments in an array and access them.
# Usage: ./array_example.sh balaji ruthvik shishir
# Ensure the script is executable: chmod +x array_example.sh    


#!/bin/bash

# Check if at least one argument is provided
if [ $# -eq 0 ]; then
    echo "No arguments provided. Please provide some arguments."
    exit 1
fi

# Store all command-line arguments in an array named 'args'
args=("$@")

# Now you can access the arguments using array indexing
echo "Number of arguments: ${#args[@]}"

# Print all arguments
echo "All arguments: ${args[@]}"

# Loop through the arguments
echo "Looping through arguments:"
for arg in "${args[@]}"; do
  echo "$arg"
done

# Access individual arguments by index
if [ ${#args[@]} -ge 1 ]; then
    echo "First argument: ${args[0]}"
fi

if [ ${#args[@]} -ge 2 ]; then
    echo "Second argument: ${args[1]}"
fi