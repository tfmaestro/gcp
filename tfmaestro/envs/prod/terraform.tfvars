project     = "<PROJECT_ID>"
region      = "europe-west1"
environment = "prod"

allow_firewall_rules = {
  "allow-http" = {
    "protocol"         = "tcp"
    "ports"            = ["80"]
    "priority"         = "1000"
    "tags"             = ["https-server"]
    "description"      = "Allow https communication."
    "source_ip_ranges" = ["0.0.0.0/0"]
  }
  "allow-https" = {
    "protocol"         = "tcp"
    "ports"            = ["443"]
    "priority"         = "1001"
    "tags"             = ["https-server"]
    "description"      = "Allow https communication."
    "source_ip_ranges" = ["0.0.0.0/0"]
  }
  "allow-ssh-vpn" = {
    "protocol"         = "tcp"
    "ports"            = ["22"]
    "priority"         = "1002"
    "description"      = "Allow ssh communication via VPN."
    "source_ip_ranges" = ["<TWOJE_IP>/32"]
  }
  "allow-icmp" = {
    "protocol"         = "icmp"
    "priority"         = "1999"
    "description"      = "Allow ICMP."
    "source_ip_ranges" = ["0.0.0.0/0"]
  }
}