terraform {
  backend "s3" {
    bucket         = "tmigrationbucketonprem2"
    key            = "migration/terraform.tfstates"
    dynamodb_table = "terraform_lock_table"
    region         = "eu-central-1"
  }
}