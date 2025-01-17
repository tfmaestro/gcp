output "load_balancer_ip" {
  description = "Public IP address of the Load Balancer"
  value       = google_compute_global_forwarding_rule.lb_frontend.ip_address
}

output "load_balancer_endpoint" {
  description = "URL or endpoint of the Load Balancer"
  value       = "http://${google_compute_global_forwarding_rule.lb_frontend.ip_address}"
}