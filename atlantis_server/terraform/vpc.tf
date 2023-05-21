# Define the VPC and subnet
resource "google_compute_network" "vpc" {
  name = var.vpc
}

