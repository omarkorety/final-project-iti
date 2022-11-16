resource "google_compute_network" "vpc_network" {
  name                    = "my-network"
  auto_create_subnetworks = false
  mtu                     = 1460
  # delete_default_routes_on_create= true
}