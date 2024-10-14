resource "google_storage_bucket" "static_site" {
  name     = var.name
  location = var.location

  website {
    main_page_suffix = var.main_page_suffix
    not_found_page   = var.not_found_page
  }

  force_destroy = var.force_destroy

  versioning {
    enabled = var.versioning
  }
}

resource "google_storage_bucket_object" "index_html" {
  name         = "index.html"
  bucket       = google_storage_bucket.static_site.name
  source       = "${path.module}/files/index.html"
  content_type = "text/html"
}

resource "google_storage_bucket_object" "Not_found_page_404_html" {
  name         = "404.html"
  bucket       = google_storage_bucket.static_site.name
  source       = "${path.module}/files/404.html"
  content_type = "text/html"
}
