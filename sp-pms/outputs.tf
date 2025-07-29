output "ecr_backend_repository_url" {
  value       = module.ecr.ecr_backend_repository_url
  description = "The URL of the ECR repository for backend (in the form aws_account_id.dkr.ecr.region.amazonaws.com/repositoryName)."
}

output "ecr_frontend_repository_url" {
  value       = module.ecr.ecr_frontend_repository_url
  description = "The URL of the ECR repository for frontend (in the form aws_account_id.dkr.ecr.region.amazonaws.com/repositoryName)."
}

output "ecr_frontend_admin_repository_url" {
  value       = module.ecr.ecr_frontend_admin_repository_url
  description = "The URL of the ECR repository for frontend admin (in the form aws_account_id.dkr.ecr.region.amazonaws.com/repositoryName)."
}

output "cicd_user_access_key_id" {
  value       = module.iam.cicd_user_access_key_id
  sensitive   = true
  description = "The Access Key ID for the CICD user"
}

output "cicd_user_access_key_secret" {
  value       = module.iam.cicd_user_access_key_secret
  sensitive   = true
  description = "The Access Key Secret for the CICD user"
}

output "fluentbit_user_access_key_id" {
  value       = module.iam.fluentbit_user_access_key_id
  sensitive   = true
  description = "The Access Key ID for the fluentbit user"
}

output "fluentbit_user_access_key_secret" {
  value       = module.iam.fluentbit_user_access_key_secret
  sensitive   = true
  description = "The Access Key Secret for the fluentbit user"
}

output "acm_arn" {
  value       = module.acm.acm_arn
  description = "The ARN of ACM"
}

output "route53_zone_id" {
  value       = module.route53.zone_id
  description = "The ID of zone"
}

output "route53_name_servers" {
  value       = module.route53.name_servers
  description = "The nameservers of the zone (to be added in domain registrar)"
}
