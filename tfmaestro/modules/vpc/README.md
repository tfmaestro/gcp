## Moduł vpc

### Zdefiniuj project
Zanim zacznisz deploy jakichkolwiek zmian w kodzie, pamiętaj o ustawieniu ID projekt w envs/provider.tf

```
provider "google" {
  project     = "<PROJECT_ID>" <- Tutaj dodaj swój project ID
  region      = var.region
}
```

Zrób to tez w poszczególnych środowiskach czyli env/dev/main.tf i env/prod/main.tf
Przykład: 
```
module "vpc" {
  source       = "../../modules/vpc"
  name         = "prod"
  project      = "<PROJECT_ID>" <- Tutaj dodaj swój project ID
  description  = "Production environment VPC"
  routing_mode = "GLOBAL"
  ...
```

Aby znaleźć project ID skorzystaj z komendy gcloud:

```
gcloud projects list
```

*Nie musisz definiować credentials w provider.tf, jeśli dodałaś/dodałeś do zmiennych środowiskowych credentiale zgodnie z lekją opisową, gdzie konfigurowaliśmy środowisko.*
*Jeśli jednak wolisz korzystać z credentials to dodaj ściezkę w provider.tf jak na przykładzie.*

```
credentials = file("/ścieżka/do/pliku-klucza.json")
```

Zainicjuj Terraforma
```
terraform init
```

Wykonaj deploy
```
terraform plan
```