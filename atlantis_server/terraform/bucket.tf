# Atlantis bucket
resource "google_storage_bucket" "atlantis_ansible_bucket" {
  name     = "atlantis-ansible-bucket-eu"
  location = var.region
  force_destroy = true
}


resource "null_resource" "upload_atlantis_ansible" {
  provisioner "local-exec" {
    command = "gsutil cp -r atlantis_ansible gs://${google_storage_bucket.atlantis_ansible_bucket.name}/"
  }

  depends_on = [google_storage_bucket.atlantis_ansible_bucket]
}

