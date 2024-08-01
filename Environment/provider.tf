provider "aws" {
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "rishis"
  region                   = "us-east-1"
}