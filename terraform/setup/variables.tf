variable "tf-state-bucket" {

  description = "name of s3 bucket with the AWS for storing tf state"
  default     = "devopsrepo-tf-state"
}
variable "tf-state-locking" {

  description = "name of the dynamo db in the AWS for locking tf state"
  default     = "devopsrepo-tf-lock"

}
variable "project" {
  description = "project name for tagging ressources"
  default     = "cloudopspipeline"
}
variable "contact" {
  description = "email contact for tagging ressources"
  default     = "houimliraed@engineergrid.com"

}