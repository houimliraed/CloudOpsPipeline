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