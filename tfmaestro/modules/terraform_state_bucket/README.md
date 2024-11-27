## Moduł terraform_state_bucket

### Ustaw unikalną nazwę dla nazwy bucketów.

Każdy bucket w chmurze GCP musi posiadać unikalną nazwę w skali całej chmury. Oznacza to, że nie możesz wykorzystać tej samej nazwy, jaka jest podana w kursie. Dodaj np. ciąg cyfr/liter na końcu nazwy "tfmaestro" i "terraform-state-logs-dev" czyli "tfmaestro-9w83r9wyf98wyf9" i "terraform-state-logs-prod-9w83r9wyf98wyf9". Nazwę ustaw w envs/prod/state_bucket.tf

```
module "terraform_state_bucket" {
  source = "../../modules/terraform_state_bucket"

  name_prefix     = "tfmaestro" <- Tutaj zmień nazwę
  environment     = var.environment
  location        = "US"
  log_bucket_name = "terraform-state-logs-dev" <- Tutaj zmień nazwę
}
```
### Dodaj project ID we właściwym miejscu.

W tej lekcji dodaliśmy take nowe pliki takie jak terraform.tfvars czy variables.tf w folderach dev i prod.
Dodaj projekt ID bezpośrednio w env/prod/terraform.tfvars i envs/dev/terraform.tfvars

```
project     = "<PROJECT_ID>" <- Tutaj dodaj swój project ID
```

Przejdź do folderu prod i zainicjuj Terraforma.
    
    ```
    terraform init
    ```
    
Wykonaj deploy.

    ```
    terraform apply
    ```
    
Wylistuj dostępne buckety.

    ```
    gsutil ls
    ```


## Migracja stanu lokalnego do bucketa

Kolejny krok to migracja plików stanu z Twojego komputera do chmury.
Aby to zrobić postępuj zgodnie z instrukcjami:

Dodaj nazwę bucketa w pliku `envs/prod/backend.tf` oraz/lub `envs/dev/backend.tf`

Aktualnie konfiguracja powinna wyglądać tak, czyli wartość dla bucket musi być podmieniona.
```
terraform {
    backend "gcs" {
        bucket = "<BUCKET_NAME>"
    }
}
```
Tak mniej więcej powinna wyglądać konfiguracja `backend.tf` z właściwą nazwą.

```
terraform {
    backend "gcs" {
        bucket = "tfmaestro-terraform-state-prod"
    }
}
```

Zmigruj stan do bucketa inicjalizując Terraforma jeszcze raz.
Postępuj zgodnie z instrukcją w terminalu.

```
terraform init
```

Ponownie wykonaj deploy

```
terraform apply
```
