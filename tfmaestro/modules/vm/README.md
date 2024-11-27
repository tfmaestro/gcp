## Moduł vm

### Zdefiniuj project ID

Project ID mozna zdefiniować w envs/prod/vm/variables.tf, jako usatwienie domyślne `default`. My skorzystamy z tej opcji. Przykład:

```
variable "project" {
  description = "The ID of the project to deploy resources in."
  type        = string
  default     = "<PROJECT_ID>" <- Tutaj dodaj swój project ID
}
```

Aternatywą jest zdefiniowanie project ID bezpośrednio w envs/prod/vm/terraform.tfvars. Przykład:

```
project = "<PROJECT_ID>" <- Tutaj dodaj swój project ID
```

### Dodaj swój klucz publichny SSH

Swtórz nowy plik `<nazwa_key>.pub` w modules/vm/ssh/ i dodaj w nim swój klucz publichny SSH na wzór kluczy w pliku np. `modules/vm/ssh/kasia_key.pub`.

Przykładowy wygląd klucza:
```
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICOxfeZ5MQG
```

Następnie dodaj w `modules/vm/main.tf` ściezkę do nowego pliku z kluczem.
Pamiętaj, aby dodać przecinek jeśli dodajesz kolejnego uytkownika do listy zogdnie z przykładem poniej.

```
...
  metadata = {
    startup-script = file("${path.module}/startup-script.sh")
    ssh-keys = join("\n", [
      "damian:${file("${path.module}/ssh/damian_key.pub")}",
      "kasia:${file("${path.module}/ssh/kasia_key.pub")}", <- Tutaj dodaj przecinek na końcu
      "<nazwa>>:${file("${path.module}/ssh/<nazwa>_key.pub")}" <- Tutaj dodaj nazwę nowego uzytkownika i ściezke do klucza
    ])
  }
```

Zainicjuj Terraforma
```
terraform init
```

Wykonać deploy
```
terraform apply
```

Wylistuj maszyny wirtualne
```
gcloud compute instances list
```
