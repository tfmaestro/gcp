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
    
    ```bash
    terraform init
    ```
    
Wykonaj deploy.
    
    ```bash
    terraform apply
    ```
    
Wylistuj dostępne buckety.
    
    ```java
    gsutil ls
    ```

