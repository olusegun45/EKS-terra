/* terraform {
  backend "s3" {
    bucket  = "cloudsecdevops-state-file"
    key     = "eks_terraform.tfstate"
    region  = "ap-southeast-2"
    encrypt = true
    dynamodb_table="cloudsecdevops-state-lock"
  }
} */