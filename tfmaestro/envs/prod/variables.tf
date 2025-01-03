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

variable "allow_firewall_rules" {
  description = "Map of firewall rules to allow."
  type = map(object({
    description      = string
    priority         = number
    protocol         = string
    ports            = optional(list(string))
    source_ip_ranges = optional(list(string))
    tags             = optional(list(string))
  }))
}
