#!/bin/bash

# MySQL database connection details
DB_USER="your_db_user"
DB_PASSWORD="your_db_password"
DB_NAME="your_db_name"

# Backup directory
BACKUP_DIR="/path/to/backup/directory"

# Number of days to retain backups
RETENTION_DAYS=7

# Create a timestamp for the backup
TIMESTAMP=$(date +%Y%m%d%H%M%S)

# Create a backup filename
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.sql"

# Perform the database backup using mysqldump
mysqldump -u"$DB_USER" -p"$DB_PASSWORD" "$DB_NAME" > "$BACKUP_FILE"

# Check if the backup was successful
if [ $? -eq 0 ]; then
    echo "Backup completed successfully: $BACKUP_FILE"
else
    echo "Backup failed. Exiting."
    exit 1
fi

# Delete backups older than the specified retention period
find "$BACKUP_DIR" -type f -name "backup_*.sql" -mtime +"$RETENTION_DAYS" -exec rm {} \;

echo "Old backups older than $RETENTION_DAYS days have been deleted."
