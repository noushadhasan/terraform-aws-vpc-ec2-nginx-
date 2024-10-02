<<<<<<< HEAD
# AWS VPC, EC2, and Nginx Project

## Project Overview

This project demonstrates the setup of an AWS infrastructure using **VPC** and **EC2**, where an Nginx web server is hosted. The infrastructure is created using **Terraform**, and the configuration is automated via **EC2 User Data scripts**. 

## Key Components

1. **VPC Configuration:**
   - Custom VPC with public and private subnets.
   - Internet Gateway for internet access.
   - Route Tables for routing traffic between subnets.

2. **EC2 Instance:**
   - Amazon Linux-based EC2 instance.
   - Nginx web server installed via User Data script.
   - Security Groups to allow HTTP (port 80) and SSH (port 22) access.

3. **Nginx Web Server:**
   - Automated installation using EC2 User Data.
   - Nginx starts automatically upon instance boot.

## Initialize Terraform and Deploy
   - terraform init
   - terraform validate
   - terraform plan
   - terraform apply

## Project Structure
│
├── main.tf                 # Terraform configuration file for VPC and EC2
├── vpc.tf                  # create virtual private cloud(vpc) in aws
├── outputs.tf              # Terraform output values
├── security_groups.tf      # create a custom sg in aws using terraform
└── ec2.tf                  # deploy an EC2 instance in aws using IAC 
=======
