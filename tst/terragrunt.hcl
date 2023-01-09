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
    region  = "eu-west-1"
  }
EOF
}

inputs = {
  ami           = "ami-00c90dbdc12232b58"
  instance_type = "t2.micro"
  tags = {
    Name = "Terragrunt EC2"
  }
}
