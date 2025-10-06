output "cd_user_access_key_id" {
  description = "aws key ID for CD user"
  value       = aws_iam_access_key.cd.id
}

output "cd_user_access_key_secret" {
  description = "access key secret for cd user"
  value       = aws_iam_access_key.cd.secret
  sensitive   = true
}


output "aws_ecr_app_repo" {

  description = "AWS Repository URL for the image of the app"

  value = aws_ecr_repository.app.repository_url

}

output "aws_ecr_proxy_repo" {

  description = "AWS Repository URL for the image of the proxy"

  value = aws_ecr_repository.proxy.repository_url

}