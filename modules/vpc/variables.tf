# VPC Network varibles

variable "vpc_name" {
  type        = string
  description = "name of the vpc"
}

variable "auto_subnetworks" {
  type        = bool
  description = "if you want the vpc to create subnets automatically"
  default     = false
}

variable "route_mode" {
  type        = string
  description = "network wide routing options either GLOBAL or REGIONAL"
}

variable "project_id" {
  type        = string
  description = "the id of the project you want to create the vpc in"
}

variable "delete_default_routes" {
  type        = bool
  description = "default routes (0.0.0.0/0) will be deleted immediately after network creation."
  default     = true
}

#Subnet 1 variables
variable "subnet1_name" {
  type        = string
  description = "name of the first subnet"
}

variable "subnet1_cidr" {
  type        = string
  description = "cidr block notation of subnet1 range, i.e. 10.0.0.0/24"
}

variable "subnet1_region" {
  type        = string
  description = "region where subnet1 resides"
}

variable "subnet1_secondary_range_name" {
  type        = string
  description = "the name of the secondary range for expansion for subnet1"
}

variable "subnet1_cidr_secondary" {
  type        = string
  description = "cidr block notation of subnet1 secondary range, i.e. 10.0.0.0/24"
}

# Subnet 2 variables
variable "subnet2_name" {
  type        = string
  description = "name of the second subnet"
}

variable "subnet2_cidr" {
  type        = string
  description = "cidr block notation of subnet2 range, i.e. 10.0.0.0/24"
}
variable "subnet2_region" {
  type        = string
  description = "region where subnet2 resides"
}
variable "subnet2_secondary_range_name" {
  type        = string
  description = "the name of the secondary range for expansion for subnet2"
}

variable "subnet2_cidr_secondary" {
  type        = string
  description = "cidr block notation of subnet2 secondary range, i.e. 10.0.0.0/24"
}

#Subnet 3 variables
variable "subnet3_name" {
  type        = string
  description = "name of the third subnet"
}

variable "subnet3_cidr" {
  type        = string
  description = "cidr block notation of subnet2 range, i.e. 10.0.0.0/24"
}
variable "subnet3_region" {
  type        = string
  description = "region where subnet3 resides"
}
variable "subnet3_secondary_range_name" {
  type        = string
  description = "the name of the secondary range for expansion for subnet3"
}

variable "subnet3_cidr_secondary" {
  type        = string
  description = "cidr block notation of subnet3 secondary range, i.e. 10.0.0.0/24"
}


#Subnet 4 variables
variable "subnet4_name" {
  type        = string
  description = "name of the fourth subnet"
}

variable "subnet4_cidr" {
  type        = string
  description = "cidr block notation of subnet2 range, i.e. 10.0.0.0/24"
}

variable "subnet4_region" {
  type        = string
  description = "region where subnet4 resides"
}
variable "subnet4_secondary_range_name" {
  type        = string
  description = "the name of the secondary range for expansion for subnet4"
}

variable "subnet4_cidr_secondary" {
  type        = string
  description = "cidr block notation of subnet4 secondary range, i.e. 10.0.0.0/24"
}

# Cloud nat router variables
variable "nat_name" {
  type        = string
  description = "name of the nat router"
}
