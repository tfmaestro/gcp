module "vpc" {
  source       = "../../modules/vpc"
  name         = "prod"
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