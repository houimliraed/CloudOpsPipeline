
variable "tf-state-bucket" {

  description = "Name of the s3 bucket in aws for storing terraform state"
  default     = "devopsrepo-tf-state"

}

variable "devopsrepo-tf-lock" {

  description = "Name of the dynamodb table for storing the terraform lock"
  default     = "devopsrepo-tf-lock"

}

variable "project" {

  description = "project name for tagging ressources"
  default     = "CloudOpsPipeline"

}

variable "contact" {

  description = "contact name for tagging ressources"
  default     = "houimliraed@engineergrid.com"

}