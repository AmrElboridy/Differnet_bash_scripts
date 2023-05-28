#!/bin/bash

folder_path="/path/to/folder"  # Specify the folder path here

# Iterate through all files in the folder
for file in "$folder_path"/*; do
    if [ -f "$file" ]; then  # Check if it's a regular file
        echo "Filling file: $file"
        
        # Generate random data and overwrite the file
        base64 /dev/urandom | head -c 1M > "$file"
        
        echo "File filled successfully."
        echo
    fi
done
