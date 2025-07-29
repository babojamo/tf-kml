variable "default_tags" {
  type        = map(string)
  description = "Default tags of resources"
}

variable "ecr_arns" {
  type        = list(string)
  description = "The list of ARN of ECR to be included in IAM resources"
}
