variable "region" {
  type = string
}

variable "environment" {
  description = "Type of environment"
  type        = string
}

variable "project" {
  description = "The ID of the project to deploy resources in."
  type        = string
  default     = "<PROJECT_ID>"
}

variable "subnetwork_ip_cidr_range" {
  description = "The CIDR range for the subnetwork."
  type        = string
}

variable "compute_engines" {
  description = "Map of compute engine instances to create, keyed by instance name."
  type = map(object({
    machine_type        = string
    machine_description = optional(string)
    machine_location    = string
    network_tags        = optional(list(string))
    ip_host             = number
  }))
}