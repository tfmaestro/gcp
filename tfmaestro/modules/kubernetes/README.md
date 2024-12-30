## Moduł kubernetes

### Zdefiniuj project
Dodaj ID projektu w envs/prod/kubernetes/terraform.tfvars

```
project     = "<PROJECT_ID>"
```
### Dodaj swój adres IP
W pliku envs/prod/kubernetes/terraform.tfvars dodaj swoje IP w trusted_ip_range Dzięki temu bez problemu uzyskasz dostęp do klastra.
Przykład: 
```
trusted_ip_range  = "<TWOJE_IP>/32"
```

Zainicjuj Terraforma
```
terraform init
```

Wykonaj deploy
```
terraform apply
```

Wylistuj utworzone klastry GKE:

```
gcloud container clusters list
```
