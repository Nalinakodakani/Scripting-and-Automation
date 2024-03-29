#Scrip1.sh: Script to automate the deployment of a web application to multiple servers. Also ensures the script handles rollback in case of failures during deployment.
            Make sure to replace the APP_DIR="/path/to/your/web/app", BACKUP_DIR="/path/to/backup/directory", and SERVERS=("server1.example.com" "server2.example.com")
            
#Script2.yaml: Kubernetes YAML configuration file to deploy a stateless microservice application with automatic scaling based on CPU utilization.

#Script3.tf: To create an IaC script to provision a scalable web application infrastructure in AWS, including instances, load balancers, and databases using Terraform.

#Script4.sh: Bash script to automate daily backups of a MySQL database and retain backups for a specified number of days.
             Replace "your_db_user", "your_db_password", "your_db_name", and "/path/to/backup/directory" with your MySQL database credentials and the directory where you want 
             to store backups.
             
#Script5.sh: Bash script that you can use to rotate log files daily, compress old log files, and delete log files older than a week.
             Make sure to replace "/path/to/log/directory" with the actual path to your log directory and "your_log_file.log" with the name of your log file.
             
#Script6.sh: Bash script to automate the process of compressing and archiving log files older than a certain number of days in a directory.
             Make sure to customize the LOG_DIR, DAYS_THRESHOLD, and ARCHIVE_DIR variables to match your specific directory paths and the number of days you want to consider 
             as the threshold for archiving.

#Script7.sh: Bash script that generates a report summarizing the disk usage of directories and subdirectories, sorted by size, starting from a specified root directory.
