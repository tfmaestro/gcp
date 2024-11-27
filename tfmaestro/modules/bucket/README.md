# Moduł Bucket

## Ustaw unikalną nazwę dla bucketa.

Każdy bucket w chmurze GCP musi posiadać unikalną nazwę w skali całej chmury.
Oznacza to, że nie możesz wykorzystać tej samej nazwy, jaka jest podana w kursie.
Dodaj np. ciąg cyfr/liter na końcu nazwy "tfmaestro-maintenance-page" czyli "tfmaestro-maintenance-page-9w83r9wyf98wyf9".

Nazwe ustaw w envs/prod/main.tf

```
module "static_site" {
  source = "../../modules/bucket"

  name             = "tfmaestro-maintenance-page"
  location         = "US"
  force_destroy    = true
  versioning       = true
  main_page_suffix = "index.html"
  not_found_page   = "404.html"
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

