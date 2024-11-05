region                   = "europe-central2"
environment              = "prod"
project                  = "hip-limiter-423316-v6"
subnetwork_ip_cidr_range = "10.0.1.0/24"
compute_engines = {
  "tfmaestro-web-app-01" = {
    machine_type        = "f1-micro"
    machine_location    = "europe-central2-a"
    network_tags        = ["app", "http-server", "https-server"]
    external_ip         = true
    machine_description = "Web application instance 01"
    ip_host             = 2
  }
  "tfmaestro-web-app-02" = {
    machine_type        = "f1-micro"
    machine_location    = "europe-central2-b"
    network_tags        = ["app", "http-server", "https-server"]
    external_ip         = true
    machine_description = "Web application instance 02"
    ip_host             = 3
  }
}