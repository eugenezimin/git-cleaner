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
bfg_file=$(find . -name "bfg*" -print -quit)

if [[ -z "$bfg_file" ]]; then
  echo "Error: No 'BFG-Cleaner' found in the local folder."
  exit 1
fi

echo "######################################################"
echo "#              Git Repo History Cleaner              #"
echo "######################################################"
echo
echo -n "Enter filename with path: " && read -p "" filename
echo "The following file will be deled: $filename"
echo

while true; do
  read -n 1 -t 60 -p "Do you want to continue? (y/n): " answer
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
      # Get terminal dimensions
      LINES=$(tput lines)
      COLS=$(tput cols)

      # Move cursor to the last line, first column
      tput el
      tput cup $((LINES - 1)) 0
      ;;
  esac
done

# Check if the filename is empty
if [[ -z "$filename" ]]; then
  echo "Error: Please enter a valid filename."
  exit 1
fi


