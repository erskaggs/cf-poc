module "vpc" {
  source = "./modules/vpc"

  vpc_name   = "cf-vpc"
  route_mode = "GLOBAL"
  project_id = "{var.project_id}"

  subnet1                      = "cf-sub-1"
  subnet1_cidr                 = "10.0.0.0/24"
  subnet1_region               = "us-east1"
  subnet1_secondary_range_name = "cf-sub-1-secondary"
  subnet1_cidr_secondary       = "10.0.5.0/24"

  subnet2                      = "cf-sub-2"
  subnet2_cidr                 = "10.0.1.0/24"
  subnet2_region               = "us-east4"
  subnet2_secondary_range_name = "cf-sub-2-secondary"
  subnet2_cidr_secondary       = "10.0.6.0/24"

  subnet3                      = "cf-sub-3"
  subnet3_cidr                 = "10.0.2.0/24"
  subnet3_region               = "us-central1"
  subnet3_secondary_range_name = "cf-sub-3-secondary"
  subnet3_cidr_secondary       = "10.0.7.0/24"

  subnet4                      = "cf-sub-4"
  subnet4_cidr                 = "10.0.4.0/24"
  subnet4_region               = "us-west1"
  subnet4_secondary_range_name = "cf-sub-4-secondary"
  subnet4_cidr_secondary       = "10.0.8.0/24"
}
