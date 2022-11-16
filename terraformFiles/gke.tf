resource "google_container_cluster" "my_cluster" {
  name     = "my-gke-cluster"
  location = "asia-east1-a"
  network=google_compute_network.vpc_network.id
  subnetwork=google_compute_subnetwork.restricted_subnet.id
  remove_default_node_pool = true 
  initial_node_count       = 1
  networking_mode= "VPC_NATIVE"

    # maintenance_exclusion {
    # exclusion_name = "batch job"
    # exclusion_options {
    #   scope = "NO_UPGRADES"
    # }
    # }
    ip_allocation_policy {
        cluster_ipv4_cidr_block = "192.168.0.0/21"
        services_ipv4_cidr_block= "192.168.8.0/27"
    }
  network_policy {
    enabled= false
  }
  private_cluster_config {
    enable_private_nodes    = true       #Enables the private cluster feature, creating a private endpoint on the cluster
    enable_private_endpoint = true       #disable public access to endpoint and access to cluster 
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }
  
    master_authorized_networks_config {
      cidr_blocks {
        cidr_block   = google_compute_subnetwork.management_subnet.ip_cidr_range
        display_name = "managment "
      }
    }
    
#   #   addons_config {
#   #      http_load_balancing {
#   #         disabled = true
#   # }
# }




}

########################################
resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "my-node-pool"
  location   = "asia-east1-a"
  cluster    = google_container_cluster.my_cluster.name
  node_count = 1
  # max_pods_per_node=100

  node_config {
    preemptible  = false
    machine_type = "e2-standard-2"

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.omar_service_account.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
    # management {
    #     auto_repair=true
    #     auto_upgrade=true
    # }
    # upgrade_settings {
    #     max_surge=1
    #     max_unavailable=0
    # }
}