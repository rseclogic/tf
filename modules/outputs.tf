#IAM Policy Output
output "policy-id" {
  description = "The policy's ID"
  value       = aws_iam_policy.policy.id
}

output "policy-arn" {
  description = "The ARN assigned by AWS to this policy"
  value       = aws_iam_policy.policy.arn
}

output "description" {
  description = "The description of the policy"
  value       = aws_iam_policy.policy.description
}

output "policy-name" {
  description = "The name of the policy"
  value       = aws_iam_policy.policy.name
}

output "policy-path" {
  description = "The path of the policy in IAM"
  value       = aws_iam_policy.policy.path
}

output "policy" {
  description = "The policy document"
  value       = aws_iam_policy.policy.policy
}

# IAM ROLE Output
output "role-id" {
  description = "The role's ID"
  value       = aws_iam_role.role.id
}

output "role-arn" {
  description = "The ARN assigned by AWS to this role"
  value       = aws_iam_role.role.arn
}

output "role-name" {
  description = "The name of the role"
  value       = aws_iam_role.role.name
}

