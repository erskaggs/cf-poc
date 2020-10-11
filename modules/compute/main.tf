resource "google_compute_disk" "public_disk1" {
  name = var.public_disk_name
  type = var.public_disk_type
  project = var.project_id
  size = var.public_disk_size
}
resource "google_compute_disk" "private_disk1" {
  name = var.private_disk_name
  type = var.private_disk_type
  project = var.project_id
  size = var.private_disk_size
}


resource "google_compute_instance" "public_instance" {
  name = var.public_compute_name
  machine_type = var.machine_type
  zone = var."${module.vpc.}"
  tags = ["ssh","http"]

  boot_disk {
    initialize_params {
      image = var.compute_image
    }
  }

  network_interface {
    network = module.vpc.vpc_network.name
    subnetwork = module.vpc.subnetwork-1.name

  access_config { }
  }
}

resource "google_compute_instance" "private_instance" {
  name = var.private_compute_name
  machine_type = var.private_machine_type
  zone = var.region"-a"
  tags = ["ssh","http"]

  boot_disk {
    initialize_params {
      image = var.private_compute_image
    }
  }

  metadata_startup_script = "sudo dnf update; sudo dnf install -y apache2; sudo systemctl enable httpd; sudo systemctl start httpd"
  network_interface {
    network = module.vpc.vpc_network.name
    subnetwork = module.vpc.subnetwork-3.name

  }
}