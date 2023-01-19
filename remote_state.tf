terraform {
  backend "s3" {
    bucket  = "niyi-alimi-state-file"
    key     = "eks_terraform.tfstate"
    region  = "ap-southeast-2"
    encrypt = true
    dynamodb_table="niyi-alimi-state-lock"
  }
}