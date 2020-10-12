resource "google_compute_global_forwarding_rule" "global_forwarding_rule" {
  name       = "${var.app_name}-global-forwarding-rule"
  project    = var.project_id
  target     = google_compute_target_http_proxy.target_http_proxy.self_link
  port_range = "80"
}

resource "google_compute_target_http_proxy" "target_http_proxy" {
  name    = "${var.app_name}-proxy"
  project = var.project_id
  url_map = google_compute_url_map.url_map.self_link
}

resource "google_compute_backend_service" "backend_service" {
  name          = "${var.app_name}-backend-service"
  project       = var.project_id
  port_name     = "http"
  protocol      = "HTTP"
  health_checks = [google_compute_health_check.healthcheck.self_link]
  backend {
    group                 = google_compute_instance_group.private_group.self_link
    balancing_mode        = "RATE"
    max_rate_per_instance = 100
  }
}

resource "google_compute_instance_group" "private_group" {
  name        = var.vm_group_name
  description = "Web servers instance group"
  zone        = var.private_server_zone
  instances = [
    var.private_compute_1
  ]
  named_port {
    name = "http"
    port = "80"
  }
}

resource "google_compute_health_check" "healthcheck" {
  name               = "${var.app_name}-healthcheck"
  timeout_sec        = 1
  check_interval_sec = 1
  http_health_check {
    port = 80
  }
}

resource "google_compute_url_map" "url_map" {
  name            = "${var.app_name}-load-balancer"
  project         = var.project_id
  default_service = google_compute_backend_service.backend_service.self_link
}
