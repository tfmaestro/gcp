module "vpc" {
  source       = "../../modules/vpc"
  name         = "prod"
  project      = var.project
  description  = "Production environment VPC"
  routing_mode = "GLOBAL"

  subnets = {
    "${var.environment}-subnet-01" = {
      cidr                     = "10.0.1.0/24"
      region                   = "europe-central2"
      private_ip_google_access = true
    },
    "${var.environment}-subnet-02" = {
      cidr                     = "10.0.2.0/24"
      region                   = "us-central1"
      private_ip_google_access = true
    }
  }
}

module "firewall" {
  source       = "../../modules/firewall"
  network_name = "${var.environment}-vpc"
  project      = var.project
  allow_firewall_rules = var.allow_firewall_rules
}

module "static_site" {
  source = "../../modules/bucket"

  name             = "tfmaestro-maintenance-page"
  location         = "US"
  force_destroy    = true
  versioning       = true
  main_page_suffix = "index.html"
  not_found_page   = "404.html"
}

module "terraform_state_bucket" {
  source = "../../modules/terraform_state_bucket"

  name_prefix     = "tfmaestro"
  environment     = var.environment
  location        = "US"
  log_bucket_name = "terraform-state-logs-prod"
}
