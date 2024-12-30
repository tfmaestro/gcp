output "cluster_ips" {
  description = "The IPs of the Kubernetes clusters from module"
  value       = module.kubernetes.cluster_ips
}