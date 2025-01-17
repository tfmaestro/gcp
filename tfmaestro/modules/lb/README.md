## Moduł lb

### Zdefiniuj project ID

Zdefiniuj project ID w envs/prod/vm/variables.tf, jako usatwienie domyślne `default`. My skorzystamy z tej opcji. Przykład:

```
variable "project" {
  description = "The ID of the project to deploy resources in."
  type        = string
  default     = "<PROJECT_ID>" <- Tutaj dodaj swój project ID
}
```

### Stwórz 2 maszyny wirtualne w jednej zonie

Przejdź do konfiguracji maszyn wirtualnych i upewnij się, ze obie są w tym samym regionie i zonie. Zmiany dokonaj w `envs/prod/vm/terraform.tfvars`. Przykład:
```
compute_engines = {
  "tfmaestro-web-app-01" = {
    machine_type        = "f1-micro"
    machine_location    = "europe-central2-b" ← TUTAJ
    network_tags        = ["app", "http-server", "https-server"]
    external_ip         = true
    machine_description = "Web application instance 01"
    ip_host             = 2
  }
  "tfmaestro-web-app-02" = {
    machine_type        = "f1-micro"
    machine_location    = "europe-central2-b" ← TUTAJ
    network_tags        = ["app", "http-server", "https-server"]
    external_ip         = true
    machine_description = "Web application instance 02"
    ip_host             = 3
  }
}
```

Przejdź do folderu `envs/prod/vm` i wykonaj deploy maszyn wirtualnych w nowych zonach.

```
terraform apply
```
Upewnij się, ze w `modules/lb/variables.tf` masz ustawioną poprawna zonę jako default:
```
variable "zone" {
  description = "The zone in which the resources will be created"
  type        = string
  default     = "europe-central2-b"
}
```

Przejdź do folderu `envs/prod/lb`.

Zainicjuj Terraforma
```
terraform init
```

Wykonać deploy
```
terraform apply
```
