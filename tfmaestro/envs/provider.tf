terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.38.0"
    }
  }
}

provider "google" {
  project     = "<PROJECT_ID>"
  region      = "europe-west1"
  # credentials = file("/ścieżka/do/pliku-klucza.json")
}