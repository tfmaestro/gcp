resource "google_storage_bucket" "terraform_state" {
  name     = "${var.name_prefix}-terraform-state-${var.environment}"
  location = var.location

  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age                   = 90
      num_newer_versions    = 1
      matches_storage_class = ["STANDARD"]
    }
  }

  uniform_bucket_level_access = true

  lifecycle {
    prevent_destroy = false
  }

  logging {
    log_bucket        = var.log_bucket_name
    log_object_prefix = "logs/"
  }

  labels = {
    environment = var.environment
    purpose     = "terraform-state"
  }
}

# # Optional: Set bucket IAM policy for additional security
# resource "google_storage_bucket_iam_member" "state_bucket_writer" {
#   bucket = google_storage_bucket.terraform_state.name
#   role   = "roles/storage.objectAdmin"
#   member = "serviceAccount:${var.terraform_service_account}"
# }

# resource "google_storage_bucket_iam_member" "state_bucket_reader" {
#   bucket = google_storage_bucket.terraform_state.name
#   role   = "roles/storage.objectViewer"
#   member = "serviceAccount:${var.terraform_service_account}"
# }
