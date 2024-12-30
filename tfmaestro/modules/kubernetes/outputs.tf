output "cluster_ips" {
  description = "The IPs of the Kubernetes clusters"
  value       = { for k, v in google_container_cluster.primary : k => v.endpoint }
}
