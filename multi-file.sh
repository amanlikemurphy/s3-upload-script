#!/bin/bash

# Read file names from the user
function read_file_names() {
    read -p "Enter file names separated by spaces: " file_names
    # Check if any file names were provided
    if [ -z "$file_names" ]; then
        echo "Error: Please provide at least one file name."
        exit 1
    fi
}

#Check file existence
function file_existence() {
    for filename in $file_names; do
  # Check if the file exists
    if [ ! -f "$filename" ]; then
    echo "Error: File $filename does not exist."
    continue
    fi
  # Check if the file already exists in S3
  file_exists=$(aws s3 ls s3://$BUCKET/$filename | grep "$filename")
   done
  }


# Handle file synchronization
function file_sync() {
    if [ ! -z "$file_exists" ]; then
    read -p "File $filename already exists in S3. Overwrite (o), Skip (s), Rename (r): " option

    case "$option" in
      o)
        aws s3 cp "$filename" s3://$BUCKET/$filename --progress
        ;;
      s)
        continue
        ;;
      r)
        read -p "Enter a new file name: " new_filename
        aws s3 cp "$filename" s3://$BUCKET/$new_filename --progress
        ;;
      *)
        echo "Invalid option. Skipping file $filename."
        ;;
    esac
  else
    aws s3 cp "$FILENAME" s3://$BUCKET | pv -W --bytes --progress
    "Uploading $FILENAME"
  fi
echo "File upload completed."
}


# Parse command-line arguement
BUCKET=$1
FILENAME=$2

# Call functions
read_file_names
file_existence
file_sync
