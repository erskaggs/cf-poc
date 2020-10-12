variable "project_id" {
  type        = string
  description = "project id of the project you want to deploy the lb into"
}

variable "app_name" {
  type        = string
  description = "application name that is using the lb"
}

variable "vm_group_name" {
  type        = string
  description = "name of the instance group that houses the backend vms"
}

variable "private_server_zone" {
  type        = string
  description = "zone where the backend servers live"
}

variable "private_compute_1" {
  type        = string
  description = "name of the 1st instance n the backend service groupap"
}
