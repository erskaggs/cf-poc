resource "google_compute_network" "vpc_network" {
  name                            = var.vpc_name
  auto_create_subnetworks         = var.auto_subnetworks
  routing_mode                    = var.route_mode
  delete_default_routes_on_create = var.delete_default_routes
}

resource "google_compute_subnetwork" "subnetwork-1" {
  name          = var.subnet1_name
  ip_cidr_range = var.subnet1_cidr
  region        = var.subnet1_region
  network       = google_compute_network.vpc_network.self_link
  secondary_ip_range {
    range_name    = var.subnet1_secondary_range_name
    ip_cidr_range = var.subnet1_cidr_secondary
  }
}

resource "google_compute_subnetwork" "subnetwork-2" {
  name          = var.subnet2_name
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
  name          = var.subnet3_name
  ip_cidr_range = var.subnet3_cidr
  region        = var.subnet3_region
  network       = google_compute_network.vpc_network.self_link
  purpose       = "PRIVATE"
  secondary_ip_range {
    range_name    = var.subnet3_secondary_range_name
    ip_cidr_range = var.subnet3_cidr_secondary
  }
}

resource "google_compute_subnetwork" "subnetwork-4" {
  provider      = google-beta
  name          = var.subnet4_name
  ip_cidr_range = var.subnet4_cidr
  region        = var.subnet4_region
  purpose       = "PRIVATE"
  network       = google_compute_network.vpc_network.self_link
  secondary_ip_range {
    range_name    = var.subnet4_secondary_range_name
    ip_cidr_range = var.subnet4_cidr_secondary
  }
}

resource "google_compute_address" "nat-ip" {
  name    = "${var.nat_name}-nat-ip"
  project = var.project_id
  region  = var.subnet3_region
}
resource "google_compute_router" "nat-router" {
  name    = "${var.nat_name}-nat-router"
  network = google_compute_network.vpc_network.name

  depends_on = [google_compute_network.vpc_network]
}
resource "google_compute_router_nat" "nat-gateway" {
  name                               = "${var.nat_name}-nat-gateway"
  router                             = google_compute_router.nat-router.name
  nat_ip_allocate_option             = "MANUAL_ONLY"
  nat_ips                            = [google_compute_address.nat-ip.self_link]
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  depends_on                         = [google_compute_address.nat-ip]
}
