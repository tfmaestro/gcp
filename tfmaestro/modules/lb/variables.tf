variable "project" {
  description = "The Google Cloud project where the resources will be created"
  type        = string
}

variable "region" {
  description = "The region in which the resources will be created"
  type        = string
}

variable "zone" {
  description = "The zone in which the resources will be created"
  type        = string
  default     = "europe-central2-b"
}