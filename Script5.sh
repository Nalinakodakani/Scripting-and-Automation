#!/bin/bash

# Log directory and file name (change as needed)
LOG_DIR="/path/to/log/directory"
LOG_FILE="your_log_file.log"

# Number of days to retain log files
RETENTION_DAYS=7

# Create a date stamp for today in YYYYMMDD format
TODAY=$(date +%Y%m%d)

# Rename the log file to include the date stamp
mv "$LOG_DIR/$LOG_FILE" "$LOG_DIR/$LOG_FILE.$TODAY"

# Compress old log files
find "$LOG_DIR" -type f -name "$LOG_FILE.*" -mtime +"$RETENTION_DAYS" -exec gzip {} \;

# Delete log files older than $RETENTION_DAYS days
find "$LOG_DIR" -type f -name "$LOG_FILE.*.gz" -mtime +"$RETENTION_DAYS" -exec rm {} \;

# Optional: You can also delete the uncompressed log files if you want
# find "$LOG_DIR" -type f -name "$LOG_FILE.*" -mtime +"$RETENTION_DAYS" -exec rm {} \;
