resource "aws_iam_user" "cicd" {
  name = "sp-pms-cicd"
}

data "aws_iam_policy_document" "cicd_policy" {
  statement {
    sid       = "ECRFullAccess"
    effect    = "Allow"
    actions   = ["ecr:*"]
    resources = var.ecr_arns
  }

  statement {
    sid       = "GetAuthorizationToken"
    effect    = "Allow"
    actions   = ["ecr:GetAuthorizationToken"]
    resources = ["*"]
  }
}

resource "aws_iam_user_policy" "cicd" {
  name   = "ECRRepositoriesFullAccess"
  user   = aws_iam_user.cicd.name
  policy = data.aws_iam_policy_document.cicd_policy.json
}

resource "aws_iam_access_key" "cicd" {
  user = aws_iam_user.cicd.name
}
