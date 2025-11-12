# Terraform-assignment
This project demonstrates deploying a highly available web application across two Availability Zones in AWS using Terraform. The application is served via nginx on EC2 instances and routed through an Application Load Balancer (ALB).

The deployment uses modular Terraform code to provision:

VPC with public and private subnets

Internet Gateway and route tables

Security Groups for EC2 and ALB

EC2 Ubuntu instances with nginx installed

ALB with listener and target group for distributing traffic

# Steps to do:
git clone <your-github-repo-url>

cd terraform-assignment/envs/dev

terraform init

terraform validate

terraform plan -var-file=terraform.tfvars

terraform apply -var-file=terraform.tfvars

terraform output


The deployed web application was accessible via the Application Load Balancer:
link http://abbie-alb-1162377497.eu-west-1.elb.amazonaws.com/


# Direct EC2 access was:

EC2 Instance 1: http://34.244.53.233

EC2 Instance 2: http://108.129.213.113

# Should return
<h1>Hello from Abbie Coombes - L00196596</h1>

# Best Practices Applied

Multi-AZ deployment for high availability

Clear separation of network, compute, and ALB resources
