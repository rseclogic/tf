# IAM Policy
resource "aws_iam_policy" "policy" {
  name        = var.policy-name
  path        = var.path
  description = var.description

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
"Version": "2012-10-17",
"Statement": [
    {
        "Sid": "VisualEditor0",
        "Effect": "Allow",
        "Action": [
            "sns:ListTagsForResource",
            "sns:ListPhoneNumbersOptedOut",
            "sns:GetEndpointAttributes",
            "sns:GetTopicAttributes",
            "sns:GetPlatformApplicationAttributes",
            "sns:GetSubscriptionAttributes",
            "sns:GetSMSAttributes",
            "sns:CheckIfPhoneNumberIsOptedOut"
        ],
        "Resource": "*"
    }
]})
}

# IAM ROLE
resource "aws_iam_role" "role" {
  name = var.role-name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::${var.AccountId}:root"
            },
            "Action": "sts:AssumeRole",
            "Condition": {
                "StringEquals": {
                    "sts:ExternalId": var.ExternalId
                }
            }
        }
    ]
})
}

resource "aws_iam_role_policy_attachment" "attach-1" {
  role       = aws_iam_role.role.name
  policy_arn = aws_iam_policy.policy.arn
}

resource "aws_iam_role_policy_attachment" "attach-2" {
  role       = aws_iam_role.role.name
  policy_arn = "arn:aws:iam::aws:policy/SecurityAudit"
}
