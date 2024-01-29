# Terraform block

terraform {
  required_version = "> 1.4"
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.51.1"
    }
  }
}