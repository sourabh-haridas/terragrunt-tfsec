terraform {
  source = "tfr:///terraform-aws-modules/ec2-instance/aws?version=4.3.0"
}


/*include {
  path = find_in_parent_folders()
}*/

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
  provider "aws" {
    profile = "default"
    region  = "eu-central-1"
    access_key = "AKIA55I2WVBE6BL5MNEX"
    secret_key = "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"
  }
EOF
}

inputs = {
  ami           = "ami-0767046d1677be5a0"
  instance_type = "t2.micro"
  tags = {
    Name = "Terragrunt EC2"
  }
}
