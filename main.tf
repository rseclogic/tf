provider "aws" {
  region = "ap-south-1"
}

module "cyberq-role" {
    source = "./modules"
    ExternalId = "raghavsingh"
    AccountId = "131860523262"
  
}
