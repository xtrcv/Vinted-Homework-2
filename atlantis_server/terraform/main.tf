# Define the compute instance
resource "google_compute_instance" "atlantis_instance" {
  name         = "atlantis-instance"
  machine_type = var.machine_type
  zone         = var.zone
  boot_disk {
    initialize_params {
      image = var.image_name #"ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }
  network_interface {
    subnetwork = google_compute_subnetwork.subnet.self_link
    network_ip = google_compute_address.atlantis_ip.address

    access_config {
      // Configure a public IP for the instance (if needed)
    }
  }
  metadata = {
    enable-oslogin = "TRUE"
  }
  service_account {
    email  = var.service_account_email #google_service_account.atlantis.name 
    scopes = ["cloud-platform"]
  }
  labels = {
    "atlantis" = "true"
  }

  # Run the Ansible playbook to install and configure Atlantis server
  metadata_startup_script = data.template_file.startup_script.rendered

}

# Create a static IP address for the Atlantis server
resource "google_compute_address" "atlantis_ip" {
  name         = "atlantis-ip"
  region       = var.region
  subnetwork   = google_compute_subnetwork.subnet.id
  address_type = "INTERNAL"
  address      = "10.0.1.42"
}