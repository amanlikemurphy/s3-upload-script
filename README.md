# S3 Single File Uploader

The script, single-file.sh allows you to upload a single file to an S3 bucket. It checks if the file exists locally before uploading it.

## Usage

```bash
s3_uploader.sh <filename> <bucket_name>

Where:

<filename> is the name of the file to upload
<bucket_name> is the name of the S3 bucket to upload the file to

## Example

s3_uploader.sh my_file.txt my-bucket


This will upload the file `my_file.txt` to the S3 bucket `my-bucket`.

I hope this helps!
