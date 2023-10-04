import re

# Define the log file path and the path to save the extracted error messages
log_file_path = "your_log_file.log"
output_file_path = "error_messages.txt"

# Regular expression pattern to match lines starting with "ERROR"
error_pattern = r'^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2},\d{3}.*ERROR.*$'

# Open the log file for reading and the output file for writing
with open(log_file_path, 'r') as log_file, open(output_file_path, 'w') as output_file:
    line_number = 0  # To keep track of the line number
    
    # Iterate through each line in the log file
    for line in log_file:
        line_number += 1
        
        # Check if the line matches the error pattern
        if re.match(error_pattern, line):
            # Write the timestamp, line number, and error message to the output file
            output_file.write(f"Line {line_number}: {line.strip()}\n")

print(f"Error messages extracted and saved to '{output_file_path}'.")
