resource "aws_route53_zone" "main" {
  name = var.domain_name
 
}

resource "aws_route53_record" "root-a" {
  zone_id = aws_route53_zone.main.zone_id
  name = var.domain_name
  type = "A"

  alias {
    name = aws_s3_bucket_website_configuration.web_bucket.website_domain
    zone_id = aws_s3_bucket.bucky.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www-a" {
  zone_id = aws_route53_zone.main.zone_id
  name = "www.${var.domain_name}"
  type = "A"

  alias {
    name = aws_s3_bucket_website_configuration.web_bucket.website_domain    
    zone_id = aws_s3_bucket.bucky.hosted_zone_id
    evaluate_target_health = false
  }
}