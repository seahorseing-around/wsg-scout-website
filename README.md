# WSG Static Website
## Simple Static Website for WSG Scouts. 

Please feel free to fork this repo for your own Scout Site.

If you're a member of WSG and want to contribute please send a collaborator request.


# Notes
- Google Document with AWS Account Details: https://docs.google.com/document/d/18WbEa5Qumo8f6hDoJRbk1vz-V55H1fqNEk1sAgX4L3E/edit?usp=sharing
- Guide followed for instructions https://www.alexhyett.com/terraform-s3-static-website-hosting/
  - Note: some elements out of date

# Resources
- National Brand https://scoutsbrand.org.uk/catalogue/category/digital/logos/scout-logo
- Static Site templates https://html5up.net
- WSG G-Suite Shared branding https://drive.google.com/drive/folders/1FVgQErbhAFs5Nhvo-L9ipOWVbHszuW0I 

# Deploying the Site
Terraform is used to deploy the site. It can be run manually OR from Github actions. A user in the AWS account was created manually with restricted permissions to run changes against allowed services. A Key & Secret was created for that user.

### Deploy Manual;y (only if you know what you're doing)
- setp local AWS creds from the Google Doc)
- terraform init --backend-config profile=scouts --backend-config key=develop/terraform.tfstate --var-file=develop-environment.tfvars
- terraform plan --var-file=develop-environment.tfvars  
- terraform apply --var-file=develop-environment.tfvars
- terraform destroy --var-file=develop-environment.tfvars


### Deploy using Github
See https://github.com/seahorseing-around/wsg-scout-website/actions
- Github actions automate running code. The job runs when code is pushed to develop or main branch
- Secret credentials (AWS key & Secret) must be manuallu setup by adding Github secrets to the repo
- If you push code to the 'develop' branch it will automatically deploy to the test url https://westsidescouts-test.click
- (NOT YET IMPLEMENTED) If you push code to the 'main' branch it will automatically deploy to the official url https://westsidescouts.org

# Web Dev
- To update the website start by pulling the repo locally
- Change the contents of ./site-contents/* to update the site
  - index.html and 404.html *MUST* exist in their current location for terraform to work
- To make content changes you should edit the .html files.
- Images can be added under images, and referenced from the html
- You can see html edits locally by opening  index.html in a browser
- When you've made your changes push the code to the *develop branch* to test it
- It it tests ok, merge to code to main to dpeloy the live site


## Tips
- Visual Studio Code is a great IDE - and plugins for Terraform and HTML help!


# TODO
- These Static site templates come with a lot of duplication - will look into Javascrpt solns
- Join page
- Section info pages
- Choose a template


# Deployment Architecture
![Arch Diagram](static-site.svg)