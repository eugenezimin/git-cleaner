#!/bin/bash

# Check Java installation
if ! command -v java >/dev/null; then
  echo "Error: Java is not installed."
  exit 1
fi

if ! command -v tput >/dev/null; then
  echo "Error: 'tput' is not installed."
  exit 1
fi

# Check for bfg file
# Check for files starting with "bfg" using ls and grep
if [[ ! $(ls | grep "^bfg") ]]; then
  echo "Error: No 'BFG-Cleaner' found in the local folder."
  exit 1
fi

echo "######################################################"
echo "#              Git Repo History Cleaner              #"
echo "######################################################"

echo
echo -n "Enter path to repo to clean (absolute): " && read -p "" repo

# Check if folder exists
if [ ! -d "$repo" ]; then
  echo "Error: Folder '$repo' does not exist."
  exit 1
fi

# Check for .git directory
if [ ! -d "$repo/.git" ]; then
  echo "Error: '$repo' is not a git repository."
  exit 1
fi

echo -n "Enter the filename to delete (from repo's root): " && read -p "" filename
# Check if the filename is empty
if [[ -z "$filename" ]]; then
  echo "Error: Please enter a valid filename."
  exit 1
fi

echo "The following file will be deleted: $filename"
echo

echo -n "Do you want to continue? (y/n): "
while true; do
  # Setting curson after the question
  tput hpa 32
  
  # Waiting for input string
  read -n 1 -t 60 -p "" answer
  case "$answer" in
    y)
      echo
      echo "Deleting..."
      break
      ;;
    n)
      echo
      echo "Exiting..."
      exit 0
      ;;
    *)
      # Move cursor one symbol left and 
      # clean up till the end of the string
      tput cub1
      tput el
      ;;
  esac
done



