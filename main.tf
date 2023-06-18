resource "google_storage_bucket" "the_website" {
  name          = "BUCKET_NAME" // TODO Replace with your own!
  location      = "us-central1"
  force_destroy = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
}

resource "google_storage_bucket_object" "website_files" {
  name   = "index.html"
  bucket = google_storage_bucket.the_website.name
  source = "statics/index.html"
  content_type = "text/html"
}
