output "cicd_user_access_key_id" {
  value       = aws_iam_access_key.cicd.id
  sensitive   = true
  description = "The Access Key ID for the CICD user"
}

output "cicd_user_access_key_secret" {
  value       = aws_iam_access_key.cicd.secret
  sensitive   = true
  description = "The Access Key Secret for the CICD user"
}

output "fluentbit_user_access_key_id" {
  value       = aws_iam_access_key.fluentbit.id
  sensitive   = true
  description = "The Access Key ID for the fluentbit user"
}

output "fluentbit_user_access_key_secret" {
  value       = aws_iam_access_key.fluentbit.secret
  sensitive   = true
  description = "The Access Key Secret for the fluentbit user"
}
