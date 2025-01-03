variable "name" {
  description = "The name of the VPC"
  type        = string
}

variable "project" {
  description = "The GCP project ID"
  type        = string
}

variable "description" {
  description = "The description of the VPC"
  type        = string
}

variable "auto_create_subnetworks" {
  description = "Whether to auto-create subnetworks"
  type        = bool
  default     = false
}

variable "routing_mode" {
  description = "The routing mode for the VPC"
  type        = string
}

variable "subnets" {
  description = "Map of subnets to create"
  type = map(object({
    cidr                     = string
    region                   = string
    private_ip_google_access = bool
  }))
}