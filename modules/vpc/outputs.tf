output "network_name" {
  value = google_compute_network.vpc_network.name
}

output "subnet1" {
  value = google_compute_subnetwork.subnetwork-1.name
}

output "subnet2" {
  value = google_compute_subnetwork.subnetwork-2.name
}

output "subnet3" {
  value = google_compute_subnetwork.subnetwork-3.name
}

output "subnet4" {
  value = google_compute_subnetwork.subenetwork-4.name
}
