output "cd_user_access_key_id" {
  description = "cd user access key ID for user"
  value       = aws_iam_access_key.cd.id

}
output "cd_user_access_key_secret" {
  description = "cd user access key secret for user"
  value       = aws_iam_access_key.cd.secret
  sensitive   = true

}