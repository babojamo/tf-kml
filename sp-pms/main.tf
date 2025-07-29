locals {
  default_tags = {
    Client    = "SPMS"
    Project   = "SP"
    ManagedBy = "Terraform"
  }
  acm_domain_name = "spms.buuzzk.store"
  acm_subject_alternative_names = [
    "dev.spms.buuzzk.store",       # dev FE  
    "dev-api.spms.buuzzk.store",   # dev BE
  ]
}

module "ecr" {
  source       = "./modules/ecr"
  default_tags = local.default_tags
}

module "acm" {
  source                    = "./modules/acm"
  default_tags              = local.default_tags
  domain_name               = local.acm_domain_name
  subject_alternative_names = local.acm_subject_alternative_names
}

module "iam" {
  source       = "./modules/iam"
  default_tags = local.default_tags
  ecr_arns = [
    module.ecr.ecr_backend_arn,
    module.ecr.ecr_frontend_arn,
    module.ecr.ecr_frontend_admin_arn,
  ]
}

module "route53" {
  source           = "./modules/route53"
  default_tags     = local.default_tags
  zone_name        = local.acm_domain_name
  is_existing_zone = false
}
