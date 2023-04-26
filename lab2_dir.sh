#!/bin/bash
# moves the sub-directories in a directory that match sub-directories in another directory (a filter directory), and moves the matching files into the desired directory
# Define the source and destination directories
src_dir="/home/crustless/Downloads/LaboratoryProj/LaboratoryProject"
dest_dir="/home/crustless/Documents/Personal/University/Graduate/5th_term_Mesc/TA_ECE3331/Lab_Marking/Lab2"
new_dir="/home/crustless/Desktop/Graduate/5th_term_Mesc/TA_ECE3331/Lab_Marking/Proj"

# Define the pattern to match directories by
pattern="*"


# Loop through each directory in the destination directory
for dir in "$dest_dir"/*; do
    # Get the name of the directory without its path
    dir_name="$(basename "$dir")"
    
    # Check if the directory exists in the source directory
    if [ -d "$src_dir/$dir_name" ]; then
        # Move the directory to the new directory
        mv "$src_dir/$dir_name" "$new_dir"
    fi
done
