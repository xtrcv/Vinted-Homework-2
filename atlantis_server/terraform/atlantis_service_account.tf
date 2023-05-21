resource "google_service_account" "atlantis" {
  account_id   = "atlantis"
  display_name = "Atlantis Server Service Account"
}

# For Atlantis can see itself
resource "google_project_iam_member" "atlantis_viewer" {
  project = google_service_account.atlantis.project
  role    = "roles/viewer"
  member  = "serviceAccount:${google_service_account.atlantis.email}"
}

# For the default service account to see the Atlantis service account
resource "google_project_iam_member" "atlantis_side_viewer" {
  project = google_service_account.atlantis.project
  role    = "roles/viewer"
  member  = "serviceAccount:${var.service_account_email}"
}

# So that Atlantis could pick up bucket (admin should be changed in real life prod environment)
resource "google_project_iam_member" "atlantis_storage_admin" {
  project = google_service_account.atlantis.project
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.atlantis.email}"
}
