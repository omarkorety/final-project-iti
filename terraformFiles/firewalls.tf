resource "google_compute_firewall" "rules" {
  project       = var.my-project-id
  name          = "my-firewall-rule"
  network       = google_compute_network.vpc_network.name
  description   = "Creates firewall rule targeting tagged instances"
  direction     = "INGRESS"
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["22","80","433"]
  }
}


# ##########################################
# resource "google_compute_firewall" "allow_instances" {
#   project       = var.my-project-id
#   name          = "allow-instances"
#   network       = google_compute_network.vpc_network.name
#   description   = "Creates firewall rule targeting tagged instances"
#   direction     = "EGRESS"
#   priority = 500
#   target_tags=["omar"] #tag to specify the instance that will be allowed to acess the internet
#   destination_ranges = ["0.0.0.0/0"]

#   allow {
#     protocol = "tcp"
#   }
# }
# #################################################

# #block all access to the internet
# resource "google_compute_firewall" "block" {
#   project       = var.my-project-id
#   name          = "my-block-rule"
#   network       = google_compute_network.vpc_network.name
#   description   = "Creates firewall rule targeting tagged instances"
#   direction     = "EGRESS"
#   priority = 1000
#   destination_ranges = ["0.0.0.0/0"]

#   deny {
#     protocol = "tcp"

#   }
# }
# resource "google_compute_route" "route" {
#   name        = "network-route"
#   dest_range  = "10.2.0.0/16"
#   network     = google_compute_network.vpc_network.name
# #   next_hop_ip = google_compute_instance.private-vm.IP
#   priority    = 100
# }