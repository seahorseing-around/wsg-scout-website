output "s3_url" {
    value = aws_s3_bucket.bucky.bucket_domain_name
}

output "s3_web_out" {
    value = aws_s3_bucket_website_configuration.web_bucket.website_endpoint
}

output "s3_url_out" {
    value = format("https://%s",var.domain_name)
}