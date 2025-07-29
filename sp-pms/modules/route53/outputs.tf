output "zone_id" {
  value       = var.is_existing_zone ? data.aws_route53_zone.zone[0].zone_id : aws_route53_zone.zone[0].zone_id
  description = "The ID of zone"
}

output "name_servers" {
  value       = var.is_existing_zone ? [] : aws_route53_zone.zone[0].name_servers
  description = "The nameservers of the zone (to be added in domain registrar)"
}
