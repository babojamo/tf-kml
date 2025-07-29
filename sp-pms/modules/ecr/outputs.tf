output "ecr_backend_arn" {
  value       = aws_ecr_repository.backend.arn
  description = "The ARN of the ECR repository for backend."
}

output "ecr_backend_repository_url" {
  value       = aws_ecr_repository.backend.repository_url
  description = "The URL of the ECR repository for backend (in the form aws_account_id.dkr.ecr.region.amazonaws.com/repositoryName)."
}

output "ecr_frontend_arn" {
  value       = aws_ecr_repository.frontend.arn
  description = "The ARN of the ECR repository for frontend."
}

output "ecr_frontend_repository_url" {
  value       = aws_ecr_repository.frontend.repository_url
  description = "The URL of the ECR repository for frontend (in the form aws_account_id.dkr.ecr.region.amazonaws.com/repositoryName)."
}

output "ecr_frontend_admin_arn" {
  value       = aws_ecr_repository.frontend_admin.arn
  description = "The ARN of the ECR repository for frontend admin."
}

output "ecr_frontend_admin_repository_url" {
  value       = aws_ecr_repository.frontend_admin.repository_url
  description = "The URL of the ECR repository for frontend admin (in the form aws_account_id.dkr.ecr.region.amazonaws.com/repositoryName)."
}
