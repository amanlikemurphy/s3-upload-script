#!/bin/bash

# Define functions
function check_file_exists() {
    if [ ! -f "$FILENAME" ]; then
        echo "Error: File $FILENAME does not exist."
        exit 1
    fi
}

function upload_to_s3() {
    aws s3 cp "$FILENAME" s3://$BUCKET
}

function check_upload_status() {
    if [ $? -ne 0 ]; then
        echo "Error: Upload failed."
        exit 1
    fi
}

function print_success_message() {
    echo "File $FILENAME successfully uploaded to s3://$BUCKET."
}

# Parse command-line arguement
FILENAME=$1
BUCKET=$2

# Call functions
check_file_exists
upload_to_s3
check_upload_status
print_success_message