variable "default_tags" {
  type        = map(string)
  description = "Default tags of resources"
}

variable "zone_name" {
  type        = string
  description = "The name (mainly a domain) of the zone"
}

variable "is_existing_zone" {
  type        = bool
  description = "Flag to determine if the zone is already created or not"
}
