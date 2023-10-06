#!/bin/bash

# Configuration
APP_DIR="/path/to/your/web/app"
BACKUP_DIR="/path/to/backup/directory"
SERVERS=("server1.example.com" "server2.example.com")
BRANCH="main"

# Function to deploy the application to a single server
deploy_to_server() {
    local server="$1"
    
    # Step 1: Backup current version
    echo "Backing up the current version on $server..."
    ssh "$server" "cp -r $APP_DIR $BACKUP_DIR/backup_$(date '+%Y%m%d%H%M%S')"

    # Step 2: Pull the latest code from version control
    echo "Pulling the latest code from $BRANCH branch on $server..."
    ssh "$server" "cd $APP_DIR && git pull origin $BRANCH"

    # Step 3: Additional deployment steps (e.g., database migrations, npm install, etc.)
    # ssh "$server" "cd $APP_DIR && <your-deployment-steps>"

    # Step 4: Restart the web server (replace with your server's actual command)
    echo "Restarting the web server on $server..."
    ssh "$server" "<web-server-restart-command>"

    # Check if the deployment was successful
    if [ $? -eq 0 ]; then
        echo "Deployment to $server completed successfully."
    else
        echo "Deployment to $server failed. Rolling back..."
        rollback "$server"
        exit 1
    fi
}

# Function to rollback to the previous version
rollback() {
    local server="$1"
    local latest_backup=$(ssh "$server" "ls -d $BACKUP_DIR/backup_* | tail -n 1")

    if [ -n "$latest_backup" ]; then
        echo "Rolling back to the previous version on $server..."
        ssh "$server" "cp -r $latest_backup/* $APP_DIR"
        echo "Rollback on $server completed."
    else
        echo "No backups found for rollback on $server."
    fi
}

# Main deployment loop
for server in "${SERVERS[@]}"; do
    deploy_to_server "$server"
done

echo "Deployment to all servers completed successfully."
