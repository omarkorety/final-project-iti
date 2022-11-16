resource "google_compute_subnetwork" "management_subnet" {
  name                     = "managementsubnet"
  ip_cidr_range            = "10.2.0.0/16"
  region                   = var.my_region
  private_ip_google_access = true
  network                  = google_compute_network.vpc_network.id
}
resource "google_compute_subnetwork" "restricted_subnet" {
  name          = "restrictedsubnet"
  ip_cidr_range = "10.3.0.0/16"
  region        = var.my_region
  network       = google_compute_network.vpc_network.id
}
