provider "google" {
  project = var.project_id
}

terraform {
  backend "gcs" {
    bucket = "vinted-bucket"
    prefix = "atlantis-server"
  }
}