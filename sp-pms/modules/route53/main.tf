resource "aws_route53_zone" "zone" {
  count = var.is_existing_zone ? 0 : 1
  name  = var.zone_name
}

data "aws_route53_zone" "zone" {
  count        = var.is_existing_zone ? 1 : 0
  name         = var.zone_name
  private_zone = false
}
