#!/bin/bash

set -e
export DATA_PATH=${DATA_PATH:-/data/}

echo "Job started: $(date)"
if [ -n "$ZIP_NAME" ]; then
    echo "Zipping contents of $DATA_PATH to $ZIP_NAME"
    zip -r "$ZIP_NAME" "$DATA_PATH" 
    /usr/local/bin/s3cmd sync $PARAMS "$ZIP_NAME" "$S3_PATH"
else
    echo "Uploading all of $DATA_PATH to $S3_PATH"
    /usr/local/bin/s3cmd sync $PARAMS "$DATA_PATH" "$S3_PATH"
fi
echo "Job finished: $(date)"
