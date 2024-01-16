module "s3" {
  source = "git::https://github.com/Andreadote/terraform-Tesla-s3.git//s3-module?ref=v1.5.2"
}


terraform {
  backend "s3" {
    bucket = "elasticbeanstalk-ca-central-1-109753259968"
    key    = "action/terraform.tfstate"
    region = "ca-central-1"
  }
}
