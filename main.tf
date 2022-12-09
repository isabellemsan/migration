resource "aws_vpc" "on_prem_dc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "on_prem_dc"
  }
}

resource "aws_s3_bucket" "migration_backend_bucket" {
  bucket = "tmigrationbucketonprem2"
  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name        = "tmigrationbucketonprem2"
    Environment = "Test"
    Team        = "Migration"
    Owner       = "Isabelle"
  }
}
resource "aws_s3_bucket_versioning" "version_my_bucket" {
  bucket = aws_s3_bucket.migration_backend_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "terraform_lock_table" {
  name           = "terraform-lock"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "terraform-lock"
  }
}

data "aws_ami" "ubuntu_image" {
  most_recent = true
  owners      = [var.ubuntu_image_owner]

  filter {
    name   = "name"
    values = [var.ubuntu_image_name]
  }
}
