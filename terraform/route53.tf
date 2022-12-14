resource "aws_route53domains_registered_domain" "domain" {
  domain_name = var.domain_name

  name_server {
    name = aws_route53_zone.main.name_servers[0]
  }

  name_server {
    name = aws_route53_zone.main.name_servers[1]
  }

  name_server {
    name = aws_route53_zone.main.name_servers[2]
  }

  name_server {
    name = aws_route53_zone.main.name_servers[3]
  }

}

resource "aws_route53_zone" "main" {
  name = var.domain_name
}

#resource "aws_route53_record" "ns" {
#  zone_id = aws_route53_zone.main.zone_id
#  name    = var.domain_name
#  type    = "NS"
#  ttl     = "30"
#  records = [ # taken from registered domain 
#    "ns-695.awsdns-22.net",
#    "ns-354.awsdns-44.com",
#    "ns-1415.awsdns-48.org",
#    "ns-1911.awsdns-46.co.uk"
#  ]
#}

resource "aws_route53_record" "www-a" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "www.${var.domain_name}"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.www_s3_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.www_s3_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "root-a" {
  zone_id = aws_route53_zone.main.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.www_s3_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.www_s3_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}
