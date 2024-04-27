terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.25.0"
    }
  }
}

provider "google" {
  #configuration options
project = "tensile-thinker-416401"
region = "us-central1"
zone = "us-central1-a"
credentials = "tensile-thinker-416401-88d4b19e445a.json"
}

resource "google_storage_bucket" "static-site" {
  name          = "easyriders_r_petite"
  location      = "us-central1"
  force_destroy = true

  uniform_bucket_level_access = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
  cors {
    origin          = ["http://image-store.com"]
    method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
    response_header = ["*"]
    max_age_seconds = 3600
  }
}

