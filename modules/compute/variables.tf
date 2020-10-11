#Public compute disk variables
variable "public_disk_name" {
  type        = string
  description = "name of the public disk"
}
variable "public_disk_type" {
  type        = string
  description = "type of disk used for public"
}
variable "public_disk_size" {
  type        = string
  description = "how big in GB is the size of the disk"
}

#Private compute disk variables
variable "private_disk_name" {
  type        = string
  description = "name of the private disk"
}
variable "private_disk_type" {
  type        = string
  description = "type of disk used for private"
}
variable "private_disk_size" {
  type        = string
  description = "how big in GB is the size of the disk"
}


# Public compute instance variables
variable "public_compute_name" {
  type        = string
  description = "name of the compute instance"
}
variable "public_machine_type" {
  type        = string
  description = "what type of compute instance to use"
  default     = "n2-standard-2"
}
variable "public_compute_image" {
  type        = string
  description = "which image to install onto the compute instance"
}

# Private compute instance variables

variable "private_compute_name" {
  type        = string
  description = "name of the compute instance"
}
variable "private_machine_type" {
  type        = string
  description = "what type of compute instance to use"
  default     = "n2-standard-2"
}
variable "private_compute_image" {
  type        = string
  description = "which image to install onto the compute instance"
}
