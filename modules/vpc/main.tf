resource "google_compute_network" "vpc_network" {
  name                            = var.vpc_name
  auto_create_subnetworks         = var.auto_subnetworks
  routing_mode                    = var.route_mode
  project                         = var.project_id
  delete_default_routes_on_create = var.delete_default_routes
}

resource "google_compute_subnetwork" "subnetwork-1" {
  name          = var.subnet1
  ip_cidr_range = var.subnet1_cidr
  region        = var.subnet1_region
  network       = google_compute_network.vpc_network.self_link
  secondary_ip_range {
    range_name    = var.subnet1_secondary_range_name
    ip_cidr_range = var.subnet1_cidr_secondary
  }
}

resource "google_compute_subnetwork" "subnetwork-2" {
  name          = var.subnet2
  ip_cidr_range = var.subnet2_cidr
  region        = var.subnet2_region
  network       = google_compute_network.vpc_network.self_link
  secondary_ip_range {
    range_name    = var.subnet2_secondary_range_name
    ip_cidr_range = var.subnet2_cidr_secondary
  }
}

resource "google_compute_subnetwork" "subnetwork-3" {
  provider      = google-beta
  name          = var.subnet3
  ip_cidr_range = var.subnet3_cidr
  region        = var.subnet3_region
  network       = google_compute_network.vpc_network.self_link
  purpose       = "INTERNAL_HTTPS_LOAD_BALANCER"
  role          = "ACTIVE"
  secondary_ip_range {
    range_name    = var.subnet3_secondary_range_name
    ip_cidr_range = var.subnet3_cidr_secondary
  }
}

resource "google_compute_subnetwork" "subnetwork-4" {
  name          = var.subnet4
  ip_cidr_range = var.subnet4_cidr
  region        = var.subnet4_region
  network       = google_compute_network.vpc_network.self_link
  secondary_ip_range {
    range_name    = var.subnet4_secondary_range_name
    ip_cidr_range = var.subnet4_cidr_secondary
  }
}
