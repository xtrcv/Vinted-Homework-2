resource "google_compute_subnetwork" "subnet" {
  name          = var.subnet_name
  region        = var.region
  project       = var.project_id
  ip_cidr_range = var.cidr_range
  network       = google_compute_network.vpc.self_link
}
