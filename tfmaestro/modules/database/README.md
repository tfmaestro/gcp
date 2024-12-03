## Moduł database

### Skonfiguruj zmienne środowiskowe

Ustaw w terminalu wartości dla `admin_password` i `mysql_user_password`

```
export TF_VAR_mysql_admin_password="<hasło>"
export TF_VAR_mysql_mysql_user_password="<hasło>"
```

### Dodaj project ID

Dodaj ID projektu w `envs/prod/database/terraform.tfvars`

```
project     = "<PROJECT_ID>"
```

### Skonfiguruj dostęp do bazy

Dodaj adresy IP maszyn wirtualnych, które mają mieć dostęp do bazy w `envs/prod/database/terraform.tfvars`. Opcjonalnie możesz dodać swój adres IP, aby mieć bezpośredni dostęp do maszyny, ale wtedy musisz także zainstalować sobie `mysql` lokalnie, by móc się połączyć z bazą.

```
allowed_ips = [
  "<IP>/32",
  "<IP>/32"
]
```

Przejdź do folderu prod i zainicjuj Terraforma.
    
```
terraform init
```
    
Wykonaj deploy.
    
```
terraform apply
```
    
Wylistuj dostępne bazy Cloud SQL
    
```
gcloud sql instances list
```
