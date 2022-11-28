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


# About Github actions
https://github.com/seahorseing-around/wsg-scout-website/actions

# Userguide

- To update the website start by pulling the repo locally
- To make content changed you should edit index.html - or associated .html files.
- Images can be added under images, and referenced from the html
- You can see html edits locally by opening  index.html in a browser
- If you push code to the 'develop' branch it will automatically deploy to the test url https://westsidescouts-test.click
- If you push code to the 'main' branch it will automatically deploy to the official url https://westsidescouts.org
