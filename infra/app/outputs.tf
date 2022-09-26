output "url" {
  description = "The URL where the Cloud Run Service can be accessed."
  value       = google_cloud_run_service.service.status[0].url
}
