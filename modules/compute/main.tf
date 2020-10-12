resource "google_compute_disk" "public_disk1" {
  name    = var.public_disk_name
  type    = var.public_disk_type
  project = var.project_id
  size    = var.public_disk_size
}
resource "google_compute_disk" "private_disk1" {
  name    = var.private_disk_name
  type    = var.private_disk_type
  project = var.project_id
  size    = var.private_disk_size
}


resource "google_compute_instance" "public_instance" {
  name         = var.public_compute_name
  machine_type = var.public_compute_type
  zone         = "${var.public_region1}-a"
  tags         = ["ssh", "http", "https"]

  boot_disk {
    initialize_params {
      image = var.public_compute_image
    }
  }

  network_interface {
    network    = var.public_network
    subnetwork = var.public_subnet

    access_config {}
  }
}
resource "google_compute_instance" "private_instance" {
  name         = var.private_compute_name
  machine_type = var.private_compute_type
  zone         = "${var.private_region1}-a"
  tags         = ["http", "https"]

  boot_disk {
    initialize_params {
      image = var.private_compute_image
    }
  }

  metadata_startup_script = "sudo dnf update; sudo dnf install -y apache2; sudo systemctl enable httpd; sudo systemctl start httpd"
  network_interface {
    network    = var.private_network
    subnetwork = var.private_subnet

  }
}
