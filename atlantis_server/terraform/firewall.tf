# Define the firewall rules
resource "google_compute_firewall" "ssh" {
  name    = "allow-ssh"
  network = google_compute_network.vpc.self_link

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = var.ssh_source_range #["0.0.0.0/0"]
}

resource "google_compute_firewall" "atlantis" {
  name    = "allow-atlantis"
  network = google_compute_network.vpc.self_link

  allow {
    protocol = "tcp"
    ports    = ["4141"]
  }

  source_ranges = var.atlantis_source_range #["0.0.0.0/0"]
}