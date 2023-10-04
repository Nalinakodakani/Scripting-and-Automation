#!/bin/bash

# Directory to monitor
source_dir="/path/to/source_directory"

# Archive directory
archive_dir="/path/to/archive_directory"

# Log file
log_file="/path/to/log_file.txt"

# Function to log events with timestamps
log_event() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1" >> "$log_file"
}

# Start monitoring the source directory for new files
while true; do
    # Wait for a new file to be created in the source directory
    file=$(inotifywait -q -e create "$source_dir" | awk '{print $3}')
    
    # Move the new file to the archive directory
    mv "$source_dir/$file" "$archive_dir/$file"
    
    # Log the event
    log_event "Moved '$file' to '$archive_dir'"
done
