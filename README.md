# WSG Static Website
Static Website for WSG Scouts

# 


![Arch Diagram](PlanAArch.svg)

# Plan
- [x] Implement TF manually for Subnets, Load Balancer & fargate Cluster  
- [x] Setup Github action to deploy
- [x] Expand setup to implement blue/green

# Notes

- Document with AWS Account Details: https://docs.google.com/document/d/18WbEa5Qumo8f6hDoJRbk1vz-V55H1fqNEk1sAgX4L3E/edit?usp=sharing


# Commands
- terraform init --backend-config profile=scouts --backend-config key=develop/terraform.tfstate --var-file=develop-environment.tfvars
- terraform plan --var-file=develop-environment.tfvars  