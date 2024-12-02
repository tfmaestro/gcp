## Moduł firewall

### Dodaj swój adres IP

W regule `allow-ssh-vpn` zdefiniowanej w `envs/prod/vm/terraform.tfvars` dodaj swój stały adres IP.
Moze być to równiez adres IP VPNa jeśli posiadasz stały. 
Jest to niezbędne, aby mozna było zalogować się do utworzonych maszyn po protokole SSH.

```
  "allow-ssh-vpn" = {
    "protocol"         = "tcp"
    "ports"            = ["22"]
    "priority"         = "1002"
    "description"      = "Allow ssh communication via VPN."
    "source_ip_ranges" = ["<TWOJE_IP>/32"]
  }
```

Zainicjuj Terraforma
```
terraform init
```

Wykonaj deploy
```
terraform apply
```

Wylistuj maszyny wirtualne
```
gcloud compute firewall-rules list
```
