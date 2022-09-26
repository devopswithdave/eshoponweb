# Specify the GCP Provider
provider "google" {
project = var.project_id
region  = var.region
}

##################################################################################
# LOCALS
##################################################################################

locals {
  gcs-bucket   = "${lower(var.naming_prefix)}${random_integer.sa_num.result}"
}

resource "random_integer" "sa_num" {
  min = 10000
  max = 99999
}

# Create a GCS Bucket
resource "google_storage_bucket" "my_bucket" {
name     = local.gcs-bucket
location = var.region
versioning {
    enabled = true
  }
}

## GitHub secrets

resource "github_actions_secret" "actions_secret" {
  for_each = {
    GCS_BUCKET          = google_storage_bucket.my_bucket.name
    GCP_PROJECT_ID      = var.project_id
    GCP_APP_NAME        = var.account_name
    GCP_EMAIL           = var.sc_email
    
  }

  repository      = var.github_repository
  secret_name     = each.key
  plaintext_value = each.value
}
output "gcs-bucket" {
  value = google_storage_bucket.my_bucket.name
}

