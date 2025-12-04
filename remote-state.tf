# Delete this file if you don't wish to use Terraform Remote State feature.

# Check docs/remote-state.md

# Reference:
# <https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/guides/remote-state-backend>

terraform {
  backend "s3" {
    bucket = "terraform-boilerplate-state-file"
    key    = "terraform.tfstate"
    region = "sa-brazil-1"
    endpoints = {
      s3 = "https://obs.sa-brazil-1.myhuaweicloud.com"
    }

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
  }
}

module "obs_remote_state" {
  source      = "./modules/obs-remote-state"
  region      = var.region
  bucket_name = var.obs_remote_state_bucket_name
}