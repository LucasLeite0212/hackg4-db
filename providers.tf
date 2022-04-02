terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.14.0"
    }
  }
}

# Configura o Provider Google Cloud com o Projeto
provider "google" {

  project = "hackathon-6aso-grupo04"
  region  = "us-east1"
  zone    = "us-east1-b"
}

provider "google-beta" {
  project = "hackathon-6aso-grupo04"
  region  = "us-east1"
  zone    = "us-east1-b"
}
