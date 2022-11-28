variable "bucket_name" {
  type        = string
  description = "Name of the bucket for Hosting Site"
}

variable "domain_name" {
  type = string
  description = "URL to publish the site under"
}


locals {
  mime_types = jsondecode(file("./mime.json"))
}