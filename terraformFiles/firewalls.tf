resource "google_compute_firewall" "rules" {
  project       = var.my-project-id
  name          = "my-firewall-rule"
  network       = google_compute_network.vpc_network.name
  description   = "Creates firewall rule targeting tagged instances"
  direction     = "INGRESS"
  source_ranges = ["35.235.240.0/20"]

  allow {
    protocol = "tcp"
    ports    = ["22","80","433"]
  }
}
