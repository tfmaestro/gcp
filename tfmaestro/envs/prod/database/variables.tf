variable "region" {
  description = "The region where the Cloud SQL instance will be created."
  type        = string
  default     = "us-central1"
}

variable "project" {
  description = "The ID of the project."
  type        = string
}

variable "allowed_ips" {
  type        = list(string)
  description = "List of authorized IP addresses or CIDR blocks"
}

variable "admin_password" {
  description = "Hasło dla administratora."
  type        = string
  sensitive   = true
}

variable "mysql_user_password" {
  description = "Hasło dla użytkownika MySQL."
  type        = string
  sensitive   = true
}

variable "environment" {
  description = "The environment for the deployment (e.g., dev, prod)"
  type        = string
}

variable "name_prefix" {
  description = "A prefix for naming resources"
  type        = string
}

variable "database_name" {
  description = "The name of the database."
  type        = string
}