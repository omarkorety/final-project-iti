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






# "google_service_account.omar_service_account.email",
 