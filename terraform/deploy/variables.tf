variable "prefix" {
  description = "prefix for ressources in aws"
  default     = "cop"

}

variable "project" {
  description = "project name for tagging ressources"
  default     = "CloudOpsPipeline"

}

variable "contact" {

  description = "contact email for tagging ressources"
  default     = "houimliraed@engineergrid.com"

}
variable "db_username" {
  description = "username for the app api database"
  default     = "cloudops"
}
variable "db_password" {
  description = "password for the terraform database"

}


variable "ecr_proxy_image" {
  description = "Path to the ECR repo with the proxy image"
}

variable "ecr_app_image" {
  description = "path to the ECR repo with the api image"
  
}
variable "django_secret_key" {

  description = "secret key for the django app"
  
}