data "aws_caller_identity" "current" {}

resource "aws_iam_user" "fluentbit" {
  name = "sp-pms-fluentbit"
}

data "aws_iam_policy_document" "fluentbit_policy" {
  statement {
    effect = "Allow"
    actions = [
      "logs:DeleteIntegration",
      "logs:DescribeIndexPolicies",
      "logs:GetLogDelivery",
      "logs:ListLogDeliveries",
      "logs:DeleteAccountPolicy",
      "logs:DeleteResourcePolicy",
      "logs:StopLiveTail",
      "logs:CancelExportTask",
      "logs:DeleteLogDelivery",
      "logs:DescribeQueryDefinitions",
      "logs:DescribeResourcePolicies",
      "logs:PutIndexPolicy",
      "logs:DescribeDestinations",
      "logs:DescribeQueries",
      "logs:DescribeLogGroups",
      "logs:ListLogGroupsForEntity",
      "logs:ListIntegrations",
      "logs:DescribeAccountPolicies",
      "logs:GetIntegration",
      "logs:DescribeDeliverySources",
      "logs:StopQuery",
      "logs:TestMetricFilter",
      "logs:DeleteQueryDefinition",
      "logs:PutQueryDefinition",
      "logs:PutAccountPolicy",
      "logs:PutIntegration",
      "logs:DescribeFieldIndexes",
      "logs:DescribeDeliveryDestinations",
      "logs:Link",
      "logs:CreateLogDelivery",
      "logs:PutResourcePolicy",
      "logs:DescribeExportTasks",
      "logs:ListLogGroupsForQuery",
      "logs:DescribeConfigurationTemplates",
      "logs:TestTransformer",
      "logs:UpdateLogDelivery",
      "logs:DeleteIndexPolicy",
      "logs:DescribeDeliveries",
      "logs:ListEntitiesForLogGroup"
    ]
    resources = ["*"]
  }

  statement {
    effect  = "Allow"
    actions = ["logs:*"]
    resources = [
      "arn:aws:logs:us-east-1:${data.aws_caller_identity.current.account_id}:log-group:/sp-pms:log-stream:*",
      "arn:aws:logs:us-east-1:${data.aws_caller_identity.current.account_id}:log-group:/sp-pms"
    ]
  }
}

resource "aws_iam_user_policy" "fluentbit" {
  name   = "CloudWatchLogsPolicy"
  user   = aws_iam_user.fluentbit.name
  policy = data.aws_iam_policy_document.fluentbit_policy.json
}

resource "aws_iam_access_key" "fluentbit" {
  user = aws_iam_user.fluentbit.name
}
