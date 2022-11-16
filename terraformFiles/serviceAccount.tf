resource "google_service_account" "omar_service_account" {
  account_id   = "omar-id"
  display_name = "omar-Service Account"
  description = "this is my service account"
}



resource "google_project_iam_binding" "project_iam" {
  project = var.my-project-id
  role    = "roles/container.admin"
  members = [
    # var.service_account_email,
    "serviceAccount:${google_service_account.omar_service_account.email}",
  ]
}

# resource "google_service_account_iam_member" "admin-account-iam" {
#   service_account_id = google_service_account.omar_service_account.name
#   role               = "roles/iam.seiceAccountUser"

#   member = "google_service_account.omar_service_account.email"
# }





# "google_service_account.omar_service_account.email",
 