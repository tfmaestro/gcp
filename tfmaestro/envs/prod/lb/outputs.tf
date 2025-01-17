output "load_balancer_ip" {
  description = "Public IP of the Load Balancer"
  value       = module.lb.load_balancer_ip
}

output "load_balancer_endpoint" {
  description = "Endpoint URL of the Load Balancer"
  value       = module.lb.load_balancer_endpoint
}