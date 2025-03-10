resource "aws_vpc" "vpc_virginia" {
  cidr_block = var.virginia_cidr


  tags = {
    "Name" = "vpc_virginia-${local.sufix}"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc_virginia.id
  cidr_block              = var.subnets[0]
  map_public_ip_on_launch = true
  tags = {
    "Name" = "public_subnet-${local.sufix}"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.vpc_virginia.id
  cidr_block = var.subnets[1]
  tags = {
    "Name" = "private_subnet-${local.sufix}"
  }

  depends_on = [aws_subnet.public_subnet]
}

resource "aws_internet_gateway" "igw_virginia" {
  vpc_id = aws_vpc.vpc_virginia.id

  tags = {
    Name = "igw vpc virginia-${local.sufix}"
  }
}

resource "aws_route_table" "public_crt" {
  vpc_id = aws_vpc.vpc_virginia.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_virginia.id
  }

  tags = {
    Name = "public_crt-${local.sufix}"
  }
}

resource "aws_route_table_association" "crta_public_subnet" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_crt.id
}

resource "aws_security_group" "sg_public_instance" {
  name        = "Public Instance SG"
  description = "Allow SSH inbound traffic, https and ALL egress traffic"
  vpc_id      = aws_vpc.vpc_virginia.id


dynamic "ingress" {
    for_each = var.ingress_ports_list
    content {
      description = "Allow ${ingress.value} inbound traffic"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = [var.sg_ingress_cidr]
    }
  }
  

 # Reglas de Egress (Salientes)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow ALL outbound traffic"
  }

    tags = {
    Name = "Public Instance SG-${local.sufix}"
  }
}

 module "my_bucket" {
  source = "./modulos/s3"
  bucket_name = "pinyonet-bucket-05032025"
   
 }

 output "s3_arn" {
  description = "ARN del bucket"
  value       = module.my_bucket.s3_bucket_arn
  
}

  #  module "terraform_state_backend" {
  #    source = "cloudposse/tfstate-backend/aws"
  #    version     = "1.5.0"
  #    namespace  = "prueba"
  #    stage      = "prod"
  #    name       = "terraform"
  #    attributes = ["state"]

  #    terraform_backend_config_file_path = "."
  #    terraform_backend_config_file_name = "backend.tf"
  #    force_destroy                      = false
  #  }