variable "project" {
  description = "The Google Cloud project where the resources will be created"
  type        = string
  default     = "<PROJECT_ID>"
}

variable "region" {
  description = "The region in which the resources will be created"
  type        = string
  default     = "europe-central2"
}