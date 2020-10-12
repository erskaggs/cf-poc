module "vpc" {
  source = "./modules/vpc"

  vpc_name   = "cf-vpc"
  route_mode = "GLOBAL"
  project_id = var.project_id

  subnet1_name                 = "cf-sub-1"
  subnet1_cidr                 = "10.0.0.0/24"
  subnet1_region               = "us-east1"
  subnet1_secondary_range_name = "cf-sub-1-secondary"
  subnet1_cidr_secondary       = "10.0.5.0/24"

  subnet2_name                 = "cf-sub-2"
  subnet2_cidr                 = "10.0.1.0/24"
  subnet2_region               = "us-east4"
  subnet2_secondary_range_name = "cf-sub-2-secondary"
  subnet2_cidr_secondary       = "10.0.6.0/24"

  subnet3_name                 = "cf-sub-3"
  subnet3_cidr                 = "10.0.2.0/24"
  subnet3_region               = "us-central1"
  subnet3_secondary_range_name = "cf-sub-3-secondary"
  subnet3_cidr_secondary       = "10.0.7.0/24"

  subnet4_name                 = "cf-sub-4"
  subnet4_cidr                 = "10.0.4.0/24"
  subnet4_region               = "us-west1"
  subnet4_secondary_range_name = "cf-sub-4-secondary"
  subnet4_cidr_secondary       = "10.0.8.0/24"
}

module "firewall" {
  source     = "./modules/firewall"
  depends_on = [module.vpc]
  vpc_name   = module.vpc.network_name
}

module "compute" {
  source     = "./modules/compute"
  project_id = var.project_id
  depends_on = [module.vpc]

  public_region1  = module.vpc.subnet1_region
  private_region1 = module.vpc.subnet3_region

  public_network = module.vpc.network_name
  public_subnet  = module.vpc.subnet1_name

  private_network = module.vpc.network_name
  private_subnet  = module.vpc.subnet3_name

  public_compute_name  = "public_compute"
  public_compute_type  = "n2-standard-2"
  public_compute_image = "rhel-cloud/rhel-8"

  public_disk_name = "public_disk"
  public_disk_type = "pd-standard"
  public_disk_size = "20"

  private_compute_name  = "private_compute"
  private_compute_type  = "n2-standard-2"
  private_compute_image = "rhel-cloud/rhel-8"

  private_disk_name = "private_disk"
  private_disk_type = "pd-standard"
  private_disk_size = "20"
}
