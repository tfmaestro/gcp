module "lb" {
  source           = "../../../modules/lb"
  region           = var.region
  project          = var.project
}

