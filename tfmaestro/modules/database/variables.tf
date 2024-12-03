variable "region" {
  description = "The region where the Cloud SQL instance will be created."
  type        = string
  default     = "us-central1"
}

variable "tier" {
  description = "The tier for the Cloud SQL instance."
  type        = string
  default     = "db-f1-micro"
}

variable "environment" {
  type = string
}

variable "mysql_user_password" {
  description = "Hasło dla użytkownika MySQL."
  type        = string
  sensitive   = true
}

variable "admin_password" {
  description = "Hasło dla admina MySQL."
  type        = string
  sensitive   = true
}

variable "project" {
  description = "The ID of the project."
  type        = string
}

variable "database_name" {
  description = "The name of the database."
  type        = string
}
variable "allowed_ips" {
  type = list(string)
  description = "List of authorized IP addresses or CIDR blocks"
}