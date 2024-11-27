terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.38.0"
    }
  }
}

provider "google" {
<<<<<<< HEAD
  project     = var.project
  region      = var.region
=======
  project     = "<PROJECT_ID>"
  region      = "europe-west1"
>>>>>>> static-update-v3
}