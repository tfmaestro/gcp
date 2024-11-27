module "vpc" {
  source       = "../../modules/vpc"
  name         = var.environment
  project      = var.project
  description  = "Development environment VPC"
  routing_mode = "GLOBAL"

  subnets = {
    "${var.environment}-subnet-01" = {
      cidr                     = "10.0.3.0/24"
      region                   = "europe-central2"
      private_ip_google_access = true
    },
    "${var.environment}-subnet-02" = {
      cidr                     = "10.0.4.0/24"
      region                   = "us-central1"
      private_ip_google_access = true
    }
  }
}
