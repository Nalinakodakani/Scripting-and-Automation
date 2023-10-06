# main.tf

# Configure the AWS provider
provider "aws" {
  region = "us-east-1"  # Change to your desired region
}

# Define an EC2 instance
resource "aws_instance" "webapp_instances" {
  ami           = "ami-12345678"  # Replace with your desired AMI
  instance_type = "t2.micro"      # Choose an appropriate instance type

  # Add more configuration as needed (e.g., user data, security groups)
}

# Define a security group for the EC2 instances
resource "aws_security_group" "webapp_sg" {
  name        = "webapp-sg"
  description = "Security group for web application"

  # Add inbound and outbound rules as needed
}

# Define an Application Load Balancer
resource "aws_lb" "webapp_lb" {
  name               = "webapp-lb"
  internal           = false
  load_balancer_type = "application"
  subnets            = ["subnet-12345678", "subnet-98765432"]  # Replace with your subnet IDs
  enable_deletion_protection = false

  enable_http2 = true

  # Define listeners and target group(s)
  listener {
    protocol = "HTTP"
    port     = 80

    default_action {
      type             = "fixed-response"
      fixed_response {
        content_type = "text/plain"
        status_code  = "200"
        message_body = "OK"
      }
    }
  }

  # Define a target group for your EC2 instances
  target_group {
    name     = "webapp-target-group"
    protocol = "HTTP"
    port     = 80

    health_check {
      path        = "/"
      protocol    = "HTTP"
      port        = "traffic-port"
      interval    = 30
      timeout     = 10
    }
  }
}

# Define an RDS database
resource "aws_db_instance" "webapp_db" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"  # Replace with your preferred database engine
  engine_version       = "5.7"    # Replace with the desired engine version
  instance_class       = "db.t2.micro"
  name                 = "webappdb"
  username             = "db_user"
  password             = "db_password"
  parameter_group_name = "default.mysql5.7"
}

# Output the public DNS of the load balancer
output "load_balancer_dns" {
  value = aws_lb.webapp_lb.dns_name
}
