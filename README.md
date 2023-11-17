# S3 Single File Uploader

The script, single-file.sh allows you to upload a single file to an S3 bucket. It checks if the file exists locally before uploading it.

## Usage

```bash
single-file.sh <filename> <bucket_name>

Where:

<filename> is the name of the file to upload
<bucket_name> is the name of the S3 bucket to upload the file to

## Example

single-file.sh my_file.txt my-bucket

This will upload the file `my_file.txt` to the S3 bucket `my-bucket`.

## Tutorial

You'll find the full documentation here:

---------------------------------------------------------------------------------------------------------------------------------------

**# S3 Multi File Uploader**

This script allows you to upload multiple files to an S3 bucket. It checks if each file exists locally before uploading it and handles file synchronization if a file already exists in S3.

## Usage

```bash
multi-file.sh

When you run it, It will ask for the file names and bucket name.

## Tutorial

You'll find the full documentation here:

I hope this helps!
