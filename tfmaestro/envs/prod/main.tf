module "vpc" {
  source       = "../../modules/vpc"
  name         = "prod"
  project      = "<PROJECT_ID>"
  description  = "Production environment VPC"
  routing_mode = "GLOBAL"

  subnets = {
    "prod-subnet-01" = {
      cidr                     = "10.0.1.0/24"
      region                   = "europe-central2"
      private_ip_google_access = true
    },
    "prod-subnet-02" = {
      cidr                     = "10.0.2.0/24"
      region                   = "us-central1"
      private_ip_google_access = true
    }
  }
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
