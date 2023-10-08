#!/bin/bash

# Directory where log files are located
LOG_DIR="/path/to/log/directory"

# Number of days after which log files should be archived
DAYS_THRESHOLD=7

# Archive directory
ARCHIVE_DIR="/path/to/archive/directory"

# Create the archive directory if it doesn't exist
mkdir -p "$ARCHIVE_DIR"

# Current date in YYYYMMDD format
CURRENT_DATE=$(date +%Y%m%d)

# Find and compress log files older than DAYS_THRESHOLD days
find "$LOG_DIR" -type f -name "*.log" -mtime +"$DAYS_THRESHOLD" -exec gzip {} \;

# Move compressed log files to the archive directory
find "$LOG_DIR" -type f -name "*.log.gz" -exec mv {} "$ARCHIVE_DIR" \;

# Print a message
echo "Log files older than $DAYS_THRESHOLD days have been compressed and moved to $ARCHIVE_DIR."
