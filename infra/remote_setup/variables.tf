variable "project_id" {
default = "df-eshoponweb"
type        = string
}

variable "account_name" {
default = "eshoponweb"
type        = string
}

variable "sc_email" {
default = "eshoponweb@df-eshoponweb.iam.gserviceaccount.com"
type        = string
}

variable "naming_prefix" {
  type    = string
  default = "dflab"
}


variable "region" {
description = "Google Cloud region"
type        = string
default     = "europe-west2"
}

variable "github_repository" {
  type    = string
  default = "eshoponweb"
}