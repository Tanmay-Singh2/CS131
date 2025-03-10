#!/bin/bash

# Get a timestamp for filenames
timestamp=$(date "+%F-%T")

# Define dataset path
dataset_path=~

# Process each vendorid and create separate files using a for loop
for vendor in 1.0 2.0 4.0; do
    output_file="${timestamp}-${vendor}.csv"
    
    # Using sed to extract lines where vendorid is in the first column
    sed -n "/^${vendor},/p" ${dataset_path}/2019-*.csv > "$output_file"

    # Appending the files to .gitignore
    if ! grep -q "$output_file" .gitignore 2>/dev/null; then
        echo "$output_file" >> .gitignore
    fi
done

# Creating ws4.txt with word count results
wc ${timestamp}-*.csv > ws4.txt

# Appending the contents of .gitignore to ws4.txt
echo -e "\nContents of .gitignore:" >> ws4.txt
cat .gitignore >> ws4.txt

