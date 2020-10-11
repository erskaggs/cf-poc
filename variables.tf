variable "project_id" {
  type        = string
  description = "project id where this will be deployed to"
}

variable "region" {
  type        = string
  description = "region where you will deploy your infrastructure to"
  default     = "us-central1"
}
