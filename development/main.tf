variable "cidr_block" {} 
variable "aws_region" {}


 provider "aws" { 
 	region = var.aws_region 
} 

terraform { 
	backend "s3" { 
    	bucket     = "terraform-state-mobann-jenkins-live" 
        key        = "mobann/development/network/terraform.tfstate" 
        region     = "us-east-1" 
        encrypt    = true 
   }
} 

resource "aws_vpc" "main_vpc" { 
	cidr_block           = var.cidr_block 
    enable_dns_support   = true 
    enable_dns_hostnames = true 
    
    tags = { 
    	Name        = "jenkins-instance-main_vpc" 
    } 
}