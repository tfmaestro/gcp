variable "project" {
  description = "The GCP project ID to use for resources"
  type        = string
}

variable "region" {
  type = string
}

variable "environment" {
  description = "Type of environment"
  type        = string
}

variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
}