locals {
  ecr_lifecycle_policy = {
    rules = [
      {
        rulePriority = 1
        description  = "Keep last 20 images of all images"
        selection = {
          tagStatus   = "any"
          countType   = "imageCountMoreThan"
          countNumber = 20
        }
        action = {
          type = "expire"
        }
      }
    ]
  }
}

# Frontend ECR
resource "aws_ecr_repository" "frontend" {
  name                 = "sp-pms-frontend"
  image_tag_mutability = "MUTABLE"
  force_delete         = false

  encryption_configuration {
    encryption_type = "AES256"
  }

  image_scanning_configuration {
    scan_on_push = false
  }
}

# Frontend ECR lifecycle policy
resource "aws_ecr_lifecycle_policy" "frontend" {
  repository = aws_ecr_repository.frontend.name
  policy     = jsonencode(local.ecr_lifecycle_policy)
}

# Backend ECR
resource "aws_ecr_repository" "backend" {
  name                 = "sp-pms-backend"
  image_tag_mutability = "MUTABLE"
  force_delete         = false

  encryption_configuration {
    encryption_type = "AES256"
  }

  image_scanning_configuration {
    scan_on_push = false
  }
}

# Backend ECR lifecycle policy
resource "aws_ecr_lifecycle_policy" "backend" {
  repository = aws_ecr_repository.backend.name
  policy     = jsonencode(local.ecr_lifecycle_policy)
}

# Frontend Admin ECR
resource "aws_ecr_repository" "frontend_admin" {
  name                 = "sp-pms-frontend-admin"
  image_tag_mutability = "MUTABLE"
  force_delete         = false

  encryption_configuration {
    encryption_type = "AES256"
  }

  image_scanning_configuration {
    scan_on_push = false
  }
}

# Frontend Admin ECR lifecycle policy
resource "aws_ecr_lifecycle_policy" "frontend_admin" {
  repository = aws_ecr_repository.frontend_admin.name
  policy     = jsonencode(local.ecr_lifecycle_policy)
}
