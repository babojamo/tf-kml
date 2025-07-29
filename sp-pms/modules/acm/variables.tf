variable "default_tags" {
  type        = map(string)
  description = "Default tags of resources"
}

variable "domain_name" {
  type        = string
  description = "The domain name of the ACM cert"
}

variable "subject_alternative_names" {
  type        = list(string)
  description = "The list of additional domains"
}
