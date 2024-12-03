resource "google_sql_database_instance" "mysql_db" {
  name                = "${var.environment}-mysql-db"
  database_version    = "MYSQL_8_0"
  deletion_protection = false
  region              = var.region
  project             = var.project
  settings {
    tier = var.tier

    ip_configuration {
      ipv4_enabled = true

      dynamic "authorized_networks" {
        for_each = var.allowed_ips
        iterator = server
        content {
          name  = "autorized_network-${server.value}"
          value = server.value
        }
      }
    }
  }
}

resource "google_sql_user" "admin" {
  name     = "admin"
  password = var.admin_password
  instance = google_sql_database_instance.mysql_db.name
  project  = var.project
}

resource "google_sql_user" "mysql_user" {
  name     = "mysql_user"
  password = var.mysql_user_password
  instance = google_sql_database_instance.mysql_db.name
  project  = var.project
}

resource "google_sql_database" "app_database" {
  name     = var.database_name
  instance = google_sql_database_instance.mysql_db.name
  project  = var.project

  depends_on = [google_sql_database_instance.mysql_db]
}