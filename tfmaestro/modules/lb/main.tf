
data "google_compute_subnetwork" "subnet" {
  name    = "prod-subnet-01"
  region  = var.region
  project = var.project
}

data "google_compute_instance" "main" {
  for_each = {
    "tfmaestro-web-app-01" = var.zone
    "tfmaestro-web-app-02" = var.zone
  }
  name     = each.key
  zone     = each.value
  project  = var.project
}

resource "google_compute_instance_group" "instance_group" {
  name        = "tfmaestro-instance-group"
  project     = var.project
  zone        = var.zone
  description = "Instance group for load balancing"

  instances = [for instance in data.google_compute_instance.main : instance.self_link]

  named_port {
    name = "http"
    port = 80
  }
}

resource "google_compute_health_check" "lb_health_check" {
  name               = "lb-health-check"
  project            = var.project
  check_interval_sec = 5
  timeout_sec        = 5
  healthy_threshold  = 2
  unhealthy_threshold = 2

  http_health_check {
    port         = 80
    request_path = "/health"
  }
}

resource "google_compute_backend_service" "lb_backend_service" {
  name                  = "lb-backend-service"
  project               = var.project
  protocol              = "HTTP"
  health_checks         = [google_compute_health_check.lb_health_check.self_link]
  timeout_sec           = 30
  port_name             = "http"

  backend {
    group = google_compute_instance_group.instance_group.self_link
  }
}

resource "google_compute_url_map" "lb_url_map" {
  name            = "tfmaestro-lb-url-map"
  project         = var.project
  default_service = google_compute_backend_service.lb_backend_service.self_link
}

resource "google_compute_target_http_proxy" "lb_http_proxy" {
  name        = "tfmaestro-lb-http-proxy"
  project     = var.project
  url_map     = google_compute_url_map.lb_url_map.self_link
}

resource "google_compute_global_forwarding_rule" "lb_frontend" {
  name       = "tfmaestro-lb-frontend"
  project    = var.project
  target     = google_compute_target_http_proxy.lb_http_proxy.self_link
  port_range = "80"
  ip_protocol = "TCP"
}

