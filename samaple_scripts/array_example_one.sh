# Author: Balaji Reddy Lachhannagari
# Date: 2025-05-30
# Version: 1.0
# Description: This script shows how to create an array, add elements, delete an element, and display the size of the array.
# Usage: Run the script in a bash shell to see the output.
# Copyright: @ Rushi Technologies

#!/bin/bash

#Create an array
declare -a users

# Uncomment the next line to create an empty array
#users=() # Empty Array
# Uncomment the next line to create an array with predefined elements
#users=(Balaji Ruthvik Shishir Rajesh David Rohit) # Array with elements
  
# Adding elements to the array
users[0]=Balaji
users[1]=Ruthvik
users[2]=Shishir
users[3]=Rajesh
users[4]=David
users[5]=Rohit

#Displaying the array values using *

echo "Displaying the array values using *: " ${users[*]}

#Displaying the array values using @
echo "Displaying all the values (using @)  in arrya are: " ${users[@]}

#Deleting an element from array
#To delete an element from array, we can use unset command
#Here we are deleting 4th element (index starts from 0)

unset users[4]

# Sleep command is used to wait for a specified amount of time before executing the next command
# Uncomment the next line if you want to see the effect of deletion
#sleep 10
#Display the array values after deletion
echo "Displaying all the values after deleting 4th element: "  ${users[@]}

#Display the size or lenght of the array
echo "The array size is: " ${#users[@]}

# Display the size or length of the array using *
echo "The array size using * is: " ${#users[*]}
# Display the size or length of the array using @
echo "The array size using @ is: " ${#users[@]}
# Displaying the first 4 elements of the array
echo  ${users[@]:0:4}