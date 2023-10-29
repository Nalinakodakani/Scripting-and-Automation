#!/bin/bash

# Check if the user provided a root directory as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <root_directory>"
    exit 1
fi

# Store the provided root directory in a variable
root_directory="$1"

# Check if the root directory exists
if [ ! -d "$root_directory" ]; then
    echo "Error: The specified directory does not exist."
    exit 1
fi

# Generate the disk usage report and sort it by size
du -h --max-depth=1 "$root_directory" | sort -h

