virginia_cidr = "10.10.0.0/16"

# public_subnet = "10.10.0.0/24"
# private_subnet = "10.10.1.0/24"

subnets = ["10.10.0.0/24", "10.10.1.0/24"]

tags = {
  "name"        = "vpc_prueba"
  "env"         = "Dev"
  "cloud"       = "AWS"
  "IAC"         = "Terraform"
  "IAC_Version" = "v1.8.2"
  "owner"       = "Pinyonet"
  "project"     = "coenta"
  "region"      = "valencia"
}

sg_ingress_cidr = "0.0.0.0/0"

ec2_specs = {
  "ami"           = "ami-04681163a08179f28"
  "instance_type" = "t2.micro"
}

# enable_monitoring = true

enable_monitoring = 0

ingress_ports_list = [ 22, 80, 443 ]
