# allow http traffic
resource "google_compute_firewall" "allow-http" {
  name    = "fw-allow-http"
  network = var.vpc_name
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  target_tags = ["http"]
}
# allow https traffic
resource "google_compute_firewall" "allow-https" {
  name    = "fw-allow-https"
  network = var.vpc_name
  allow {
    protocol = "tcp"
    ports    = ["443"]
  }
  target_tags = ["https"]
}
# allow ssh traffic
resource "google_compute_firewall" "allow-ssh" {
  name    = "fw-allow-ssh"
  network = var.vpc_name
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  target_tags = ["ssh"]
}
