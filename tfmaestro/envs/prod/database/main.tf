provider "google" {
}

module "database" {
  source              = "../../../modules/database"
  project             = var.project
  environment         = var.environment
  region              = var.region
  admin_password      = var.admin_password
  mysql_user_password = var.mysql_user_password
  database_name       = var.database_name
  allowed_ips         = var.allowed_ips
}