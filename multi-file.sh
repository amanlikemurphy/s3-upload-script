#!/bin/bash

# Read file names from the user
read -p "Enter file names separated by spaces: " file_names

# Check if any file names were provided
if [ -z "$file_names" ]; then
  echo "Error: Please provide at least one file name."
  exit 1
fi

# Prompt the user for S3 bucket name
read -p "Enter S3 bucket name: " bucket_name

# Check if the bucket name is provided
if [ -z "$bucket_name" ]; then
  echo "Error: Please provide the S3 bucket name."
  exit 1
fi

# Upload each file
for filename in $file_names; do
  # Check if the file exists
  if [ ! -f "$filename" ]; then
    echo "Error: File $filename does not exist."
    continue
  fi

  # Check if the file already exists in S3
  file_exists=$(aws s3 ls s3://$bucket_name/$filename | grep "$filename")

  # Handle file synchronization
  if [ ! -z "$file_exists" ]; then
    read -p "File $filename already exists in S3. Overwrite (o), Skip (s), Rename (r): " option

    case "$option" in
      o)
        aws s3 cp "$filename" s3://$bucket_name/$filename
        ;;
      s)
        continue
        ;;
      r)
        read -p "Enter a new file name: " new_filename
        aws s3 cp "$filename" s3://$bucket_name/$new_filename
        ;;
      *)
        echo "Invalid option. Skipping file $filename."
        ;;
    esac
  else
    aws s3 cp "$filename" s3://$bucket_name/$filename
  fi
done

echo "File upload completed."