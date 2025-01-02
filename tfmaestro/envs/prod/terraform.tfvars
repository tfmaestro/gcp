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
  "allow-flask-app-8080" = {
    "protocol"         = "tcp"
    "ports"            = ["8080"]
    "priority"         = "1003"
    "tags"             = ["app"]
    "description"      = "Allow Flask app TCP communication on port 8080."
    "source_ip_ranges" = ["0.0.0.0/0"]
  }
  "allow-mysql" = {
    "protocol"         = "tcp"
    "ports"            = ["3306"]
    "priority"         = "1004"
    "tags"             = ["app"]
    "description"      = "Allow MySQL traffic from Flask app to the Cloud SQL instance."
    "source_ip_ranges" = ["<PUBLIC_DATABSE_IP>", "<PUBLIC_DATABSE_IP>"]
  }
  "allow-icmp" = {
    "protocol"         = "icmp"
    "priority"         = "1999"
    "description"      = "Allow ICMP."
    "source_ip_ranges" = ["0.0.0.0/0"]
  }
}