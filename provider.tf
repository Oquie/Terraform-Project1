terraform {
  required_version = "~> 1.0"  // this ensures the version is between 1.0 ~ 1.9
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"            # Optional but recommended in production
    }
  }
}
provider "aws" {
	region = "us-east-1"
	profile = "default"  //uses default password profile from AWS credentials file
} 
